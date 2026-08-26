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
# The repository is resolved from `git -C <dir>`, a leading `cd <dir>`, or the
# hook's own cwd, in that order.
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

# ---- layer 1: parse --------------------------------------------------------

is_commit=0
is_push=0
push_targets_protected=0
dir_flag=""
cd_dir=""

# Word splitting is the point here: the operators become their own tokens.
read -r -a tokens <<<"${command//[;&|]/ & }"

i=0
count=${#tokens[@]}
while [ "$i" -lt "$count" ]; do
    token=${tokens[i]}
    i=$((i + 1))

    # `cd <dir>` at the head of a segment moves where a later git runs.
    if [ "$token" = "cd" ] && [ "$i" -lt "$count" ] && [ -z "$cd_dir" ]; then
        cd_dir=$(unquote "${tokens[i]}")
        continue
    fi

    [ "$token" = "git" ] || continue

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
        commit) is_commit=1 ;;
        push)
            is_push=1
            # A push names its destination, so a protected target is visible
            # without asking git. Whole tokens only: feature-master-test is not
            # master.
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
            ;;
    esac
done

[ "$is_commit" -eq 1 ] || [ "$is_push" -eq 1 ] || exit 0

# ---- layer 2: repository and branch ---------------------------------------

target_dir=${dir_flag:-${cd_dir:-$hook_cwd}}
target_dir=${target_dir/#\~/$HOME}
[ -n "$target_dir" ] || target_dir=$PWD

toplevel=$(git -C "$target_dir" rev-parse --show-toplevel 2>/dev/null) || toplevel=""
# Not a repository, or a path this hook cannot resolve: nothing to protect.
[ -n "$toplevel" ] || exit 0

# The one repository whose own AGENTS.md grants direct master commits.
case ${toplevel##*/} in
    mimikun.agent-system) exit 0 ;;
esac

branch=$(git -C "$target_dir" symbolic-ref --quiet --short HEAD 2>/dev/null) || branch=""

on_protected=0
case $branch in
    master | main) on_protected=1 ;;
esac

if [ "$is_commit" -eq 1 ] && [ "$on_protected" -eq 1 ]; then
    deny "Committing on $branch is blocked in this repository. rules/general.md: branch, commit, push, open a PR. Start with: git switch -c <name>"
fi

if [ "$is_push" -eq 1 ] && { [ "$push_targets_protected" -eq 1 ] || [ "$on_protected" -eq 1 ]; }; then
    deny "Pushing to master/main is blocked in this repository. rules/general.md: push a feature branch and open a PR instead."
fi

exit 0
