#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash) — deny `chezmoi add` without -S/--source.
#
# rules/general.md: agents work in a throwaway worktree, and chezmoi reaches it
# only through `chezmoi add -S <worktree>`. Without -S, chezmoi writes into the
# shared source directory, so the worktree stops isolating anything and two
# sessions can land in each other's working tree. That happened on 2026-08-03.
#
# The rule was written down after that, and a transcript count on 2026-09-14
# still found one unscoped `chezmoi add` since 2026-08-17. Direct commits in
# the shared directory had dropped to zero, so this is the only path left open.
#
# Each command segment (split on ; && || | & and newlines) is checked on its
# own, and only when it starts with `chezmoi` — after stripping `command`,
# `exec`, `env` and leading VAR=value assignments. A `chezmoi add` quoted inside
# a grep pattern or a PR body is therefore not a match.
#
# Global options are not parsed. Several take a value (-o, -D, --cache, ...),
# so walking them by arity would need the full flag table kept in sync with
# chezmoi. Instead a segment is denied when any token is `add` and no token is
# a source flag. That can deny an odd command such as `chezmoi -o add status`,
# which is the safe side to err on.
#
# Not covered: chezmoi reached through xargs, sudo, or a subshell.
#
# Contract: print the deny payload and exit 0 when the command matches, print
# nothing and exit 0 otherwise. Never exit non-zero — a failing hook aborts
# commands it was never meant to block.
#
# Cases: scripts/claude-hooks-cases/chezmoi-add-source.txt

set -euo pipefail

# Input that jq cannot parse must not abort the hook.
command=$(jq -r '.tool_input.command // empty' 2>/dev/null) || command=""

# Returns 0 when the segment runs chezmoi with an `add` token and no source flag.
is_unscoped_add() {
    local -a tokens
    read -r -a tokens <<<"$1" || true

    local i=0
    while [ "$i" -lt "${#tokens[@]}" ]; do
        case ${tokens[$i]} in
            command | exec | env) i=$((i + 1)) ;;
            [A-Za-z_]*=*) i=$((i + 1)) ;;
            *) break ;;
        esac
    done

    [ "$i" -lt "${#tokens[@]}" ] || return 1
    [ "${tokens[$i]}" = chezmoi ] || return 1

    local tok has_add=false
    for tok in "${tokens[@]:$((i + 1))}"; do
        case $tok in
            -S | -S?* | --source | --source=*) return 1 ;;
            add) has_add=true ;;
        esac
    done

    $has_add
}

segments=$(printf '%s\n' "$command" | sed -E 's/(&&|\|\||;|\||&)/\n/g')

while IFS= read -r segment; do
    if is_unscoped_add "$segment"; then
        printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"chezmoi add without -S writes into the shared source directory. Create a worktree and run: chezmoi add -S <worktree> <file>"}}'
        exit 0
    fi
done <<<"$segments"
