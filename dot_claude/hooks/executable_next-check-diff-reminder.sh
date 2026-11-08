#!/usr/bin/env bash
# PostToolUse hook (matcher: Bash|Edit|Write|MultiEdit) — after a write, find
# `next-check:` dates in the records that were not there before, and remind
# the model to look at Todoist on those dates.
#
# Not a guard. It never denies; it prints additionalContext naming the dates.
#
# next-check-todoist-reminder.sh does the same before the write, but it reads
# the command text, so it only sees a date written out after `next-check:`.
# On 2026-10-25 four dates were written through a Python script that passed
# them as variables; that hook never fired and none of the dates was looked up
# (M04 in mimikun.agent-system). This hook reads the result instead of the
# command, so the way the file was written does not matter.
#
# How it finds "new": it lists every (record, date) pair in the repository's
# worktrees and in master / origin/master, and compares that with the pairs it
# saw last time (a cache file). Refs are included because an agent usually
# commits, pushes and removes its worktree in one command, which leaves the new
# date nowhere on disk.
#
# Dates that appear literally after `next-check:` in this tool call are
# skipped: the PreToolUse hook has already named them.
#
# The first run only seeds the cache and prints nothing, so installing it does
# not report every existing date at once.
#
# Overrides (for the tests): NEXT_CHECK_REPO, NEXT_CHECK_CACHE.

set -euo pipefail

repo=${NEXT_CHECK_REPO:-$HOME/ghq/github.com/mimikun/mimikun.agent-system}
cache=${NEXT_CHECK_CACHE:-${XDG_CACHE_HOME:-$HOME/.cache}/claude-next-check/seen}

input=$(cat)
text=$(jq -r '
    .tool_input
    | [.command, .file_path, .new_string, .content, (.edits // [] | .[].new_string)]
    | map(select(type == "string"))
    | join("\n")
' <<<"$input")

# Only calls that could touch the records. Cheap check first; the scan below
# runs git once per worktree.
case $text in
*agent-system* | *records/*) ;;
*) exit 0 ;;
esac

git -C "$repo" rev-parse --git-dir >/dev/null 2>&1 || exit 0

current=$(
    {
        git -C "$repo" worktree list --porcelain | sed -n 's/^worktree //p' |
            while IFS= read -r wt; do
                [ -d "$wt/records" ] || continue
                grep -HE '^next-check:' "$wt"/records/*.md 2>/dev/null |
                    sed -E 's#^.*/records/([^:]+):next-check:[[:space:]]*#\1\t#' || true
            done
        for ref in master origin/master; do
            git -C "$repo" rev-parse -q --verify "$ref" >/dev/null || continue
            git -C "$repo" grep -E -e '^next-check:' "$ref" -- 'records/*.md' 2>/dev/null |
                sed -E 's#^[^:]+:records/([^:]+):next-check:[[:space:]]*#\1\t#' || true
        done
    } | grep -E $'\t[0-9]{4}-[0-9]{2}-[0-9]{2}$' | sort -u
)

mkdir -p "$(dirname "$cache")"
if [ ! -f "$cache" ]; then
    printf '%s\n' "$current" >"$cache"
    exit 0
fi

new=$(comm -23 <(printf '%s\n' "$current") <(sort -u "$cache") | sed '/^$/d')
printf '%s\n' "$current" | sort -u - "$cache" | sed '/^$/d' >"$cache.tmp" && mv "$cache.tmp" "$cache"

[ -z "$new" ] && exit 0

literal=$(grep -oE 'next-check:[[:space:]]+[0-9]{4}-[0-9]{2}-[0-9]{2}' <<<"$text" |
    grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | sort -u || true)

pairs=$(while IFS=$'\t' read -r file date; do
    grep -qxF "$date" <<<"$literal" && continue
    printf '%s %s\n' "${file%.md}" "$date"
done <<<"$new" | sort -u | paste -sd ',' | sed 's/,/, /g')

[ -z "$pairs" ] && exit 0

context="NEXT-CHECK DATE (found after the write): $pairs. A next-check date decides when the user will be asked something, so it is a date proposal. Unless you already did so in this turn, call find-tasks-by-date for each of those dates and check for a clash (trips, outings, other rechecks). If one clashes, move it. If you skipped that, say so in your reply (M04)."

jq -cn --arg c "$context" \
    '{hookSpecificOutput: {hookEventName: "PostToolUse", additionalContext: $c}}'
