#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny commits on master/main and pushes that
# target master/main.
#
# rules/general.md says to use a feature branch and open a PR. That is a rule an
# agent has to remember, and on 2026-08-26 one did not: the change landed as a
# commit on master in the chezmoi source repo. A commit is not a publish step,
# so the existing push guards never saw it. This hook removes the need to
# remember.
#
# Two layers, in this order:
#   1. parse  — find each git invocation and its subcommand, and read the
#               destination refspec of a push
#   2. repo   — which repository and which branch the command would act on
#
# The subcommand is parsed, not pattern-matched. `git log --grep commit` names
# commit but does not run it, and a regex loose enough to see `git -C <dir>
# commit` is also loose enough to see that.
#
# The repository is resolved from `git -C <dir>`, the `cd <dir>` in effect at
# that point in the command, or the hook's own cwd, in that order.
#
# Layer 2 runs once per git invocation, not once per command, and a `cd` updates
# the directory every git after it sees. Reading only the first `cd` and applying
# it to the whole command got both answers wrong when a command changed directory
# twice: `cd <feature> && git status; cd <master> && git commit` was allowed,
# because the commit was judged against the feature checkout it never ran in.
#
# Allowlist: mimikun.agent-system permits direct master commits by its own
# AGENTS.md. Nothing else does.
#
# Unknown state allows. A detached HEAD cannot be identified as master, and the
# dangerous half of that workflow is `git push origin HEAD:master`, which layer
# 1 catches without asking git anything.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/master-commit.txt (parse layer)
#        scripts/test-master-guard.sh (repo layer, needs git fixtures)

set -uo pipefail

deny() {
    printf '%s' "{\"hookSpecificOutput\":{\"hookEventName\":\"PreToolUse\",\"permissionDecision\":\"deny\",\"permissionDecisionReason\":\"$1\"}}"
    exit 0
}

unquote() {
    local value=$1
    value=${value%\"}
    value=${value#\"}
    value=${value%\'}
    value=${value#\'}
    printf '%s' "$value"
}

input=$(cat 2>/dev/null) || input=""
command=$(printf '%s' "$input" | jq -r '.tool_input.command // empty' 2>/dev/null) || command=""
hook_cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null) || hook_cwd=""

[ -n "$command" ] || exit 0

# ---- layer 2: repository and branch ---------------------------------------

# Denies (and exits) when <kind> would act on a protected branch of the
# repository containing <dir>. Called per git invocation, so a command that
# changes directory partway is judged where each git actually runs.
#   $1 kind             commit | push
#   $2 dir              directory that git would run in
#   $3 targets_protected  push only: 1 when the refspec names master/main
check_git() {
    local kind=$1 target_dir=$2 targets_protected=${3:-0}
    local toplevel branch on_protected=0

    target_dir=${target_dir/#\~/$HOME}
    [ -n "$target_dir" ] || target_dir=$PWD

    toplevel=$(git -C "$target_dir" rev-parse --show-toplevel 2>/dev/null) || toplevel=""
    # Not a repository, or a path this hook cannot resolve: nothing to protect.
    [ -n "$toplevel" ] || return 0

    # The one repository whose own AGENTS.md grants direct master commits.
    case ${toplevel##*/} in
        mimikun.agent-system) return 0 ;;
    esac

    branch=$(git -C "$target_dir" symbolic-ref --quiet --short HEAD 2>/dev/null) || branch=""
    case $branch in
        master | main) on_protected=1 ;;
    esac

    if [ "$kind" = commit ] && [ "$on_protected" -eq 1 ]; then
        deny "Committing on $branch is blocked in this repository. rules/general.md: branch, commit, push, open a PR. Start with: git switch -c <name>"
    fi

    if [ "$kind" = push ] && { [ "$targets_protected" -eq 1 ] || [ "$on_protected" -eq 1 ]; }; then
        deny "Pushing to master/main is blocked in this repository. rules/general.md: push a feature branch and open a PR instead."
    fi
}

# ---- layer 1: parse --------------------------------------------------------

cd_dir=""

# Word splitting is the point here: the operators become their own tokens.
read -r -a tokens <<<"${command//[;&|]/ & }"

i=0
count=${#tokens[@]}
while [ "$i" -lt "$count" ]; do
    token=${tokens[i]}
    i=$((i + 1))

    # `cd <dir>` moves where every later git in the command runs. The most recent
    # one wins: a shell does not forget the second `cd` because a first one ran.
    if [ "$token" = "cd" ] && [ "$i" -lt "$count" ]; then
        new_dir=$(unquote "${tokens[i]}")
        case $new_dir in
            # `&` is a segment break, so `cd` had no argument at all. `cd -`
            # returns somewhere this hook cannot name; leave the last known
            # directory in place rather than invent one.
            '&' | -*) ;;
            /* | '~'*) cd_dir=$new_dir ;;
            # A relative hop composes onto wherever the command already is.
            *) cd_dir=${cd_dir:+$cd_dir/}$new_dir ;;
        esac
        continue
    fi

    [ "$token" = "git" ] || continue

    # Per invocation: `git -C a commit; git commit` must not reuse a.
    dir_flag=""

    # Skip git's own options. These four take a separate argument.
    while [ "$i" -lt "$count" ]; do
        case ${tokens[i]} in
            -C | -c | --git-dir | --work-tree | --namespace)
                if [ "${tokens[i]}" = "-C" ] && [ $((i + 1)) -lt "$count" ]; then
                    dir_flag=$(unquote "${tokens[i + 1]}")
                fi
                i=$((i + 2))
                ;;
            --git-dir=* | --work-tree=*)
                i=$((i + 1))
                ;;
            -*)
                i=$((i + 1))
                ;;
            *)
                break
                ;;
        esac
    done

    [ "$i" -lt "$count" ] || break
    subcommand=${tokens[i]}
    i=$((i + 1))

    case $subcommand in
        commit)
            check_git commit "${dir_flag:-${cd_dir:-$hook_cwd}}"
            ;;
        push)
            # A push names its destination, so a protected target is visible
            # without asking git. Whole tokens only: feature-master-test is not
            # master.
            push_targets_protected=0
            while [ "$i" -lt "$count" ]; do
                case ${tokens[i]} in
                    '&') break ;;
                esac
                target=$(unquote "${tokens[i]}")
                case ${target##*:} in
                    master | main | refs/heads/master | refs/heads/main)
                        push_targets_protected=1
                        ;;
                esac
                i=$((i + 1))
            done
            check_git push "${dir_flag:-${cd_dir:-$hook_cwd}}" "$push_targets_protected"
            ;;
    esac
done

exit 0
