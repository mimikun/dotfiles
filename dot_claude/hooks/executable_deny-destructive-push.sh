#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny destructive git push.
#
# Covers force, mirror, delete and `+refspec` pushes. permissions.deny only
# matches the head of a command, so it cannot see a flag placed after the
# remote, a short form, or a push reached through a pipeline.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/destructive-push.txt

set -euo pipefail

# Input that jq cannot parse must not abort the hook. The inline version had no
# set -e and simply carried on with an empty command, so match that.
command=$(jq -r '.tool_input.command // empty' 2>/dev/null) || command=""

pattern='git[[:space:]]+push([[:space:]][^;&|]*)?[[:space:]]+(["]?\+[^[:space:]]|(--force[^[:space:]]*|--mirror|--delete|-f|-d)([[:space:]]|$))'

if printf '%s' "$command" | grep -Eq "$pattern"; then
    printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Destructive push is blocked (force, mirror, delete, or a + refspec). Run it by hand if you really need it."}}'
fi
