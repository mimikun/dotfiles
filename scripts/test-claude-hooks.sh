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
# The hook commands are read out of the settings file rather than duplicated, so
# this tests what actually runs. Each case file names its hook by statusMessage.
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
filter=${1:-}

command -v jq >/dev/null || { echo "jq is required" >&2; exit 2; }
[ -f "$settings" ] || { echo "settings not found: $settings" >&2; exit 2; }

total_fail=0
total_run=0

for case_file in "$cases_dir"/*.txt; do
    [ -e "$case_file" ] || { echo "no case files in $cases_dir" >&2; exit 2; }
    name=$(basename "$case_file" .txt)
    [ -n "$filter" ] && [[ $name != *"$filter"* ]] && continue

    status_message=$(sed -n 's/^# hook: //p' "$case_file" | head -1)
    if [ -z "$status_message" ]; then
        echo "FAIL $name: case file has no '# hook: <statusMessage>' header"
        total_fail=$((total_fail + 1))
        continue
    fi

    hook_cmd=$(jq -r --arg s "$status_message" \
        '.hooks.PreToolUse[].hooks[] | select(.statusMessage == $s) | .command' \
        "$settings")
    if [ -z "$hook_cmd" ]; then
        echo "FAIL $name: no hook in settings with statusMessage '$status_message'"
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
        if [ -n "$(printf '%s' "$payload" | sh -c "$hook_cmd")" ]; then
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
