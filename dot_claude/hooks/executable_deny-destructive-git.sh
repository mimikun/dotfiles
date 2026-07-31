#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny git clean --force and git reset --hard.
#
# Both discard uncommitted work with no undo. permissions.deny only matches the
# head of a command, so it cannot see a flag placed after the pathspec, a
# bundled short flag, or a git reached through a pipeline.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/destructive-git.txt

set -euo pipefail

# Input that jq cannot parse must not abort the hook. The inline version had no
# set -e and simply carried on with an empty command, so match that.
command=$(jq -r '.tool_input.command // empty' 2>/dev/null) || command=""

pattern='git[[:space:]]+(clean([[:space:]][^;&|]*)?[[:space:]]+(-[a-zA-Z]*f[a-zA-Z]*|--force)([[:space:]]|$)|reset([[:space:]][^;&|]*)?[[:space:]]+--hard([[:space:]]|$))'

if printf '%s' "$command" | grep -Eq "$pattern"; then
    printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"git clean --force and git reset --hard are blocked. Run it by hand if you really need it."}}'
fi
