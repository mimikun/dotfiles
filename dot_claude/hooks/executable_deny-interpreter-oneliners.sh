#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny interpreter one-liners that remove
# files or spawn processes.
#
# `python -c`, `node -e`, `perl -e` and friends are a way around every guard
# that reads the shell command, because the destructive part lives inside a
# string the shell never interprets.
#
# Two conditions, and both must hold. Matching only the interpreter would block
# every legitimate one-liner; matching only the API names would block any
# command that merely mentions them, `grep subprocess` included.
#
#   1. an interpreter invoked with -c / -e / -p / --eval / eval
#   2. a call that removes files or spawns a process
#
# Contract: print the deny payload and exit 0 when both match, print nothing
# and exit 0 otherwise. Never exit non-zero — a failing hook aborts commands it
# was never meant to block.
#
# Cases: scripts/claude-hooks-cases/interpreter-oneliners.txt

set -euo pipefail

# Input that jq cannot parse must not abort the hook. The inline version had no
# set -e and simply carried on with an empty command, so match that.
command=$(jq -r '.tool_input.command // empty' 2>/dev/null) || command=""

interpreter='(^|[[:space:];&|(/])(python[0-9.]*|node|deno|bun|perl|ruby)[[:space:]]+([^;&|]*[[:space:]])?(-[a-zA-Z]*[cep]([[:space:]]|$)|--eval([[:space:]]|=)|eval([[:space:]]|$))'
dangerous_call='(rmtree|shutil|subprocess|child_process|execSync|spawnSync|os\.system|os\.popen|os\.remove|os\.rmdir|unlink|rmSync|rmdirSync|Deno\.remove|Deno\.run|Deno\.Command|FileUtils|File\.delete|Dir\.delete|\.rmdir|truncate)'

if printf '%s' "$command" | grep -Eq "$interpreter" &&
    printf '%s' "$command" | grep -Eq "$dangerous_call"; then
    printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Interpreter one-liner touching file removal or process spawning is blocked. Write a script file, or run it by hand."}}'
fi
