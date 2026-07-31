#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny recursive rm.
#
# permissions.deny only matches the head of a command, so it cannot see a flag
# placed after the operand, a bundled short flag, or an rm reached through a
# pipeline. This hook carries those cases.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/recursive-rm.txt

set -euo pipefail

command=$(jq -r '.tool_input.command // empty')

pattern='(^|[[:space:];&|(/])rm[[:space:]]+([^;&|]*[[:space:]])?(-[a-zA-Z]*[rR][a-zA-Z]*|--recursive)([[:space:]]|$)'

if printf '%s' "$command" | grep -Eq "$pattern"; then
    printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Recursive rm is blocked. Run it by hand if you really need it."}}'
fi
