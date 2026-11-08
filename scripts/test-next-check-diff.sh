#!/usr/bin/env bash
# Regression tests for dot_claude/hooks/executable_next-check-diff-reminder.sh.
#
# That hook decides from repository state (the records in each worktree and in
# master / origin/master) and from a cache file, so its cases cannot live in
# scripts/claude-hooks-cases/. This script builds a throwaway repository and
# cache instead, and walks them through the shapes seen in practice.
#
# The hook body is never duplicated here, so this tests what actually runs. The
# settings file is checked too: without that, a typo in the hook command leaves
# every case passing against a script production never invokes.
#
# Usage: scripts/test-next-check-diff.sh
#
# Requires: bash 4+, jq, git.

set -uo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
hook="$repo_root/dot_claude/hooks/executable_next-check-diff-reminder.sh"
settings="$repo_root/dot_claude/private_settings.json"

command -v jq >/dev/null || { echo "jq is required" >&2; exit 2; }
[ -f "$hook" ] || { echo "hook not found: $hook" >&2; exit 2; }

if ! jq -e '[.hooks.PostToolUse[]?.hooks[]?.command // empty] | any(test("next-check-diff-reminder\\.sh"))' "$settings" >/dev/null; then
    echo "next-check-diff-reminder.sh is not referenced by a PostToolUse hook in $settings" >&2
    exit 2
fi

tmp=$(mktemp -d) || exit 2
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/empty-template"

export NEXT_CHECK_REPO="$tmp/mimikun.agent-system"
export NEXT_CHECK_CACHE="$tmp/cache/seen"
g() { git -C "$NEXT_CHECK_REPO" -c user.email=t@t -c user.name=t "$@"; }

# --template: init.templateDir is set globally and installs git-secrets hooks
# into every new repository. A fixture must not depend on that.
git init -q -b master --template="$tmp/empty-template" "$NEXT_CHECK_REPO"
mkdir -p "$NEXT_CHECK_REPO/records"
printf -- '---\nnext-check:     2026-11-01\n---\n' >"$NEXT_CHECK_REPO/records/P01-a.md"
printf -- '---\nstatus: 解決\n---\n' >"$NEXT_CHECK_REPO/records/P02-b.md"
g add -A && g commit -qm init

fail=0
run=0

check() { # <want: remind|quiet> <label> <expected substring or -> <payload json>
    run=$((run + 1))
    local want=$1 label=$2 expect=$3 payload=$4 out rc got
    out=$(printf '%s' "$payload" | bash "$hook")
    rc=$?
    if [ "$rc" -ne 0 ]; then
        echo "FAIL $label: exit $rc"
        fail=$((fail + 1))
        return
    fi
    if [ -n "$out" ]; then got=remind; else got=quiet; fi
    if [ "$got" != "$want" ]; then
        echo "FAIL $label: want $want, got $got${out:+ ($out)}"
        fail=$((fail + 1))
        return
    fi
    if [ "$expect" != - ] && [[ $out != *"$expect"* ]]; then
        echo "FAIL $label: output lacks '$expect': $out"
        fail=$((fail + 1))
    fi
}

bash_payload() { jq -cn --arg c "$1" '{tool_name: "Bash", tool_input: {command: $c}}'; }

# 1. First run only seeds the cache.
check quiet "first run seeds" - "$(bash_payload "grep -H ^next-check $NEXT_CHECK_REPO/records/*.md")"

# 2. The 2026-10-25 shape: a script writes the date through a variable.
wt="$tmp/mimikun.agent-system-recheck"
g worktree add -q --detach "$wt" master
printf -- '---\nnext-check:     2026-12-03\n---\n' >"$wt/records/P02-b.md"
check remind "date written through a variable" "P02-b 2026-12-03" \
    "$(bash_payload "cd $wt && python3 - <<'EOF'
nc = '2026-12-03'
s = re.sub(r'^next-check:.*', 'next-check:     ' + nc, s)
EOF")"

# 3. The same state again is not new.
check quiet "same state twice" - "$(bash_payload "cd $wt && git status")"

# 4. A literal date is the PreToolUse hook's job; do not repeat it.
printf -- '---\nnext-check:     2026-12-15\n---\n' >"$wt/records/P01-a.md"
check quiet "literal date already named before the write" - \
    "$(bash_payload "cd $wt && sed -i 's/^next-check:.*/next-check:     2026-12-15/' records/P01-a.md")"

# 5. Commit, merge to master and remove the worktree in one call: the date is
#    only in a ref by the time the hook runs.
printf -- '---\nnext-check:     2027-01-12\n---\n' >"$wt/records/P01-a.md"
git -C "$wt" -c user.email=t@t -c user.name=t commit -qam bump
g merge -q --ff-only "$(git -C "$wt" rev-parse HEAD)" 2>/dev/null || g update-ref refs/heads/master "$(git -C "$wt" rev-parse HEAD)"
g worktree remove --force "$wt"
check remind "date only left in master" "P01-a 2027-01-12" \
    "$(bash_payload "cd $wt && git commit -qam x && git push -q origin HEAD:master && git -C ../mimikun.agent-system worktree remove $wt")"

# 6. Calls that cannot touch the records are skipped without scanning.
printf -- '---\nnext-check:     2027-02-01\n---\n' >"$NEXT_CHECK_REPO/records/P02-b.md"
check quiet "unrelated command" - "$(bash_payload "ls ~")"

# 7. An Edit on a record is matched through file_path.
check remind "Edit on a record" "P02-b 2027-02-01" \
    "$(jq -cn --arg f "$NEXT_CHECK_REPO/records/P02-b.md" \
        '{tool_name: "Edit", tool_input: {file_path: $f, old_string: "a", new_string: "b"}}')"

# 8. A repository that does not exist is not an error.
NEXT_CHECK_REPO="$tmp/missing" check quiet "missing repository" - "$(bash_payload "cd agent-system")"

echo "next-check-diff-reminder: $((run - fail))/$run passed"
[ "$fail" -eq 0 ]
