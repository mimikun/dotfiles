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
# own, and only when it starts with `chezmoi`. A `chezmoi add` quoted inside a
# grep pattern or a PR body is therefore not a match.
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

has_source_flag() {
    local tok
    for tok in "$@"; do
        case $tok in
            -S | --source | --source=*) return 0 ;;
        esac
    done
    return 1
}

# Returns 0 when the segment is `chezmoi [global flags] add ...` with no source flag.
is_unscoped_add() {
    local -a tokens
    read -r -a tokens <<<"$1" || true
    [ "${#tokens[@]}" -gt 0 ] || return 1
    [ "${tokens[0]}" = chezmoi ] || return 1

    local i=1
    while [ "$i" -lt "${#tokens[@]}" ]; do
        case ${tokens[$i]} in
            -S | --source) return 1 ;;
            --source=*) return 1 ;;
            -*) i=$((i + 1)) ;;
            *) break ;;
        esac
    done

    [ "$i" -lt "${#tokens[@]}" ] || return 1
    [ "${tokens[$i]}" = add ] || return 1

    ! has_source_flag "${tokens[@]:$((i + 1))}"
}

segments=$(printf '%s\n' "$command" | sed -E 's/(&&|\|\||;|\||&)/\n/g')

while IFS= read -r segment; do
    if is_unscoped_add "$segment"; then
        printf '%s' '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"deny","permissionDecisionReason":"chezmoi add without -S writes into the shared source directory. Create a worktree and run: chezmoi add -S <worktree> <file>"}}'
        exit 0
    fi
done <<<"$segments"
