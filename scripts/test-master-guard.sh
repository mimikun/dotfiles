#!/usr/bin/env bash
# Regression tests for dot_claude/hooks/executable_deny-master-commit.sh.
#
# That hook decides from repository state — current branch, repository name — so
# its cases cannot live in scripts/claude-hooks-cases/. The shared runner passes
# a command string and nothing else, which would leave every case depending on
# whichever branch the tester happened to be on. This script builds throwaway
# repositories instead, so the answers are fixed.
#
# The hook body is never duplicated here, so this tests what actually runs. The
# settings file is checked too: without that, a typo in the hook command leaves
# every case passing against a script production never invokes.
#
# Usage: scripts/test-master-guard.sh
#
# Requires: bash 4+, jq, git.

set -uo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
hook="$repo_root/dot_claude/hooks/executable_deny-master-commit.sh"
settings="$repo_root/dot_claude/private_settings.json"

command -v jq >/dev/null || { echo "jq is required" >&2; exit 2; }
[ -f "$hook" ] || { echo "hook not found: $hook" >&2; exit 2; }

if ! jq -e '[.. | objects | .command? // empty] | any(test("deny-master-commit\\.sh"))' "$settings" >/dev/null; then
    echo "deny-master-commit.sh is not referenced by $settings" >&2
    exit 2
fi

tmp=$(mktemp -d) || exit 2
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/empty-template"

new_repo() { # <path> <branch>
    # --template: init.templateDir is set globally and installs git-secrets
    # hooks into every new repository. A fixture must not depend on a tool the
    # tester may not have installed.
    git init -q -b "$2" --template="$tmp/empty-template" "$1"
    git -C "$1" -c user.email=t@t -c user.name=t commit -q --allow-empty -m init
}

new_repo "$tmp/on-master" master
new_repo "$tmp/on-main" main
new_repo "$tmp/on-feature" feat/x
new_repo "$tmp/mimikun.agent-system" master
new_repo "$tmp/detached" master
git -C "$tmp/detached" checkout -q --detach HEAD
mkdir -p "$tmp/plain"

fail=0
run=0

check() { # <want> <cwd> <command>
    run=$((run + 1))
    local want=$1 cwd=$2 cmd=$3 out rc got
    out=$(jq -cn --arg c "$cmd" --arg d "$cwd" \
        '{tool_name: "Bash", cwd: $d, tool_input: {command: $c}}' | bash "$hook")
    rc=$?

    # A hook that exits non-zero aborts commands it was never meant to block.
    if [ "$rc" -ne 0 ]; then
        fail=$((fail + 1))
        printf '  FAIL exit=%-3s %s\n' "$rc" "$cmd"
        return
    fi

    [ -n "$out" ] && got=DENY || got=allow
    if [ "$want" != "$got" ]; then
        fail=$((fail + 1))
        printf '  FAIL want=%-5s got=%-5s [%s] %s\n' "$want" "$got" "${cwd##*/}" "$cmd"
    fi
}

# The commit that started this: on master, never pushed, invisible to the push
# guards.
check DENY "$tmp/on-master" 'git commit -m "chore: x"'
check DENY "$tmp/on-master" 'git commit --amend --no-edit'
check DENY "$tmp/on-main" 'git commit -m "chore: x"'
check DENY "$tmp/on-master" 'git add -A && git commit -m "chore: x"'
check DENY "$tmp/on-master" 'git push'
check DENY "$tmp/on-master" 'git push -u origin master'

# Feature branch: the whole point is that this stays out of the way.
check allow "$tmp/on-feature" 'git commit -m "chore: x"'
check allow "$tmp/on-feature" 'git push -u origin feat/x'
check allow "$tmp/on-feature" 'git switch -c other'
check allow "$tmp/on-feature" 'git status'
check allow "$tmp/on-feature" 'git log --oneline -3'

# The destination is visible without git, so a push names itself.
check DENY "$tmp/on-feature" 'git push origin master'
check DENY "$tmp/on-feature" 'git push origin HEAD:master'
check DENY "$tmp/on-feature" 'git push origin feat/x:master'
check DENY "$tmp/on-feature" 'git push origin refs/heads/main'
check DENY "$tmp/on-feature" 'git push origin HEAD:refs/heads/master'

# Branch names that merely contain the protected spellings.
check allow "$tmp/on-feature" 'git push origin feature-master-test'
check allow "$tmp/on-feature" 'git push origin HEAD:refs/heads/fix-main-menu'

# A parsed subcommand, not a pattern match: these name commit without running it.
check allow "$tmp/on-master" 'git log --grep commit'
check allow "$tmp/on-master" 'git show --stat commit'
check allow "$tmp/on-master" 'echo "git commit -m x" >notes.txt'

# Where git will actually operate, not where the session happens to be.
check DENY "$tmp/on-feature" "git -C $tmp/on-master commit -m x"
check allow "$tmp/on-master" "git -C $tmp/on-feature commit -m x"
check DENY "$tmp/plain" "cd $tmp/on-master && git commit -m x"
check allow "$tmp/on-master" "cd $tmp/on-feature && git commit -m x"
check DENY "$tmp/on-master" 'git -c user.name=t commit -m x'

# A command that changes directory twice. Reading only the first `cd` and
# applying it to the whole command answered both of these backwards: the guard
# denied a commit that would land on a feature branch, and — the half that
# matters — allowed one that would land on master.
check allow "$tmp/plain" "cd $tmp/on-master && git status; cd $tmp/on-feature && git commit -m x"
check DENY "$tmp/plain" "cd $tmp/on-feature && git status; cd $tmp/on-master && git commit -m x"
check DENY "$tmp/plain" "cd $tmp/on-feature && git status; cd $tmp/on-master && git push"
# A relative hop composes onto where the command already is.
check DENY "$tmp/plain" "cd $tmp && cd on-master && git commit -m x"
check allow "$tmp/plain" "cd $tmp && cd on-feature && git commit -m x"
# -C belongs to one invocation and must not leak onto the next.
check DENY "$tmp/on-feature" "git -C $tmp/on-feature status; git -C $tmp/on-master commit -m x"
check allow "$tmp/on-master" "git -C $tmp/on-master status; git -C $tmp/on-feature commit -m x"
# Every git in the command is judged, not just the last one.
check DENY "$tmp/plain" "cd $tmp/on-master && git commit -m x; cd $tmp/on-feature && git commit -m y"

# mimikun.agent-system grants direct master commits in its own AGENTS.md.
check allow "$tmp/mimikun.agent-system" 'git commit -m "chore: x"'
check allow "$tmp/mimikun.agent-system" 'git push origin HEAD:master'

# Nothing to protect, and nothing to crash on.
check allow "$tmp/plain" 'git commit -m x'
check allow "$tmp/detached" 'git commit -m x'
check allow "$tmp/on-master" 'ls -la'
check allow "$tmp/on-master" ''

echo "---"
if [ "$fail" -eq 0 ]; then
    printf 'ok   master-guard %2d cases\n' "$run"
else
    printf 'FAIL master-guard %d of %d cases\n' "$fail" "$run"
fi
exit $((fail > 0))
