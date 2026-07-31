#!/usr/bin/env bash
# Regression tests for the PreToolUse Bash hooks in dot_claude/private_settings.json.
#
# The hooks deny destructive commands by matching the Bash tool input against a
# regular expression. Prefix matching in permissions.deny only sees the head of a
# command, so these hooks carry the cases it cannot reach: flags placed after the
# operand, short and long forms, and commands reached through another tool.
#
# Every regex here has been rewritten at least once after a hole was found in it,
# so treat a change to any hook as a reason to run this first.
#
# The hook body is never duplicated here, so this tests what actually runs. A
# case file locates its hook one of two ways:
#
#   # script: <name>.sh   the hook lives in dot_claude/hooks/executable_<name>.sh
#   # hook: <statusMessage>   the hook is still inline in the settings file
#
# The second form is the pre-migration path and goes away once every hook has
# been extracted (see docs/plan/hooks-to-scripts-20260731.md). While both exist,
# a case file carrying both headers takes the script.
#
# For an extracted hook the runner also asserts that the settings file actually
# references the script. Without that, a typo in the hook command leaves every
# case passing against a script that production never invokes.
#
# Usage:
#   scripts/test-claude-hooks.sh            # run every suite
#   scripts/test-claude-hooks.sh recursive  # run suites whose file name matches
#
# Requires: bash 4+, jq.

set -uo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
settings="$repo_root/dot_claude/private_settings.json"
cases_dir="$repo_root/scripts/claude-hooks-cases"
hooks_dir="$repo_root/dot_claude/hooks"
filter=${1:-}

command -v jq >/dev/null || { echo "jq is required" >&2; exit 2; }
[ -f "$settings" ] || { echo "settings not found: $settings" >&2; exit 2; }

total_fail=0
total_run=0

for case_file in "$cases_dir"/*.txt; do
    [ -e "$case_file" ] || { echo "no case files in $cases_dir" >&2; exit 2; }
    name=$(basename "$case_file" .txt)
    [ -n "$filter" ] && [[ $name != *"$filter"* ]] && continue

    script_name=$(sed -n 's/^# script: //p' "$case_file" | head -1)
    status_message=$(sed -n 's/^# hook: //p' "$case_file" | head -1)
    script_path=""
    hook_cmd=""

    if [ -n "$script_name" ]; then
        script_path="$hooks_dir/executable_$script_name"
        if [ ! -f "$script_path" ]; then
            echo "FAIL $name: '# script: $script_name' names a file that does not exist: $script_path"
            total_fail=$((total_fail + 1))
            continue
        fi
        # The script must be what production runs, not just what passes here.
        if ! jq -e --arg n "$script_name" \
            '[.hooks[]?[]?.hooks[]?.command // empty | select(contains($n))] | length > 0' \
            "$settings" >/dev/null; then
            echo "FAIL $name: $script_name is not referenced by any hook command in settings"
            total_fail=$((total_fail + 1))
            continue
        fi
    elif [ -n "$status_message" ]; then
        hook_cmd=$(jq -r --arg s "$status_message" \
            '.hooks.PreToolUse[].hooks[] | select(.statusMessage == $s) | .command' \
            "$settings")
        if [ -z "$hook_cmd" ]; then
            echo "FAIL $name: no hook in settings with statusMessage '$status_message'"
            total_fail=$((total_fail + 1))
            continue
        fi
    else
        echo "FAIL $name: case file has no '# script:' or '# hook:' header"
        total_fail=$((total_fail + 1))
        continue
    fi

    suite_fail=0
    suite_run=0
    while IFS='|' read -r want command_under_test; do
        case $want in '' | '#'*) continue ;; esac
        suite_run=$((suite_run + 1))

        payload=$(jq -cn --arg c "$command_under_test" \
            '{tool_name: "Bash", tool_input: {command: $c}}')
        if [ -n "$script_path" ]; then
            out=$(printf '%s' "$payload" | bash "$script_path")
        else
            out=$(printf '%s' "$payload" | sh -c "$hook_cmd")
        fi
        rc=$?

        # A no-match grep exits 1, which is the normal path. A hook that lets
        # that escape aborts on every command it was not meant to block.
        if [ "$rc" -ne 0 ]; then
            suite_fail=$((suite_fail + 1))
            printf '  FAIL exit=%-3s %s\n' "$rc" "$command_under_test"
            continue
        fi

        if [ -n "$out" ]; then
            got=DENY
        else
            got=allow
        fi

        if [ "$want" != "$got" ]; then
            suite_fail=$((suite_fail + 1))
            printf '  FAIL want=%-5s got=%-5s %s\n' "$want" "$got" "$command_under_test"
        fi
    done <"$case_file"

    if [ "$suite_fail" -eq 0 ]; then
        printf 'ok   %-24s %2d cases\n' "$name" "$suite_run"
    else
        printf 'FAIL %-24s %2d of %d cases\n' "$name" "$suite_fail" "$suite_run"
    fi
    total_run=$((total_run + suite_run))
    total_fail=$((total_fail + suite_fail))
done

echo "---"
if [ "$total_fail" -eq 0 ]; then
    echo "all $total_run cases passed"
else
    echo "$total_fail of $total_run cases failed"
fi
exit $((total_fail > 0))
