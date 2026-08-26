#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny merging a pull request.
#
# rules/general.md: merging is the owner's job, done by hand in the GitHub web
# UI. An agent stops once the PR is open. Merging moves master, and the two
# checks around that rule (read `git cherry`, count the commits afterwards)
# exist to hand the owner something to decide with.
#
# The companion guard, deny-master-commit.sh, blocks commits on master and
# pushes to master. `gh pr merge` reaches the same place through the API, so it
# needs its own guard: git never sees it.
#
# Covers the subcommand and the `gh api` route to the same endpoint, since the
# latter is what remains once the subcommand is blocked.
#
# Not covered: `berg` (Codeberg). Its merge syntax is not established here, and
# a guessed pattern would deny the wrong commands. `git merge` is also out of
# scope — a local merge is not a publish step.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/pr-merge.txt

set -euo pipefail

# Input that jq cannot parse must not abort the hook.
command=$(jq -r '.tool_input.command // empty' 2>/dev/null) || command=""

# The middle group carries gh's global flags (`gh --repo o/r pr merge`). Quotes
# stop it, so a merge named inside a `--search` string is not a match.
subcommand='gh[[:space:]]+([^;&|"'\'']*[[:space:]]+)?pr[[:space:]]+merge([[:space:]]|$)'
api='gh[[:space:]]+([^;&|"'\'']*[[:space:]]+)?api([[:space:]]|$)'
merge_endpoint='pulls/[^[:space:]/]+/merge'

if printf '%s' "$command" | grep -Eq "$subcommand" ||
    { printf '%s' "$command" | grep -Eq "$api" &&
        printf '%s' "$command" | grep -Eq "$merge_endpoint"; }; then
    printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"Merging a PR is the owner'\''s job, done by hand in the GitHub web UI. Stop once the PR is open and report its number."}}'
fi
