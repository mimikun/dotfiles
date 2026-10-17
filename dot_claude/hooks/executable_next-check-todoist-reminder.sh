#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash|Edit|Write|MultiEdit) — when a write sets a
# `next-check:` date in a record, remind the model to look at Todoist on that
# date first.
#
# Not a guard. It never denies; it prints additionalContext naming the dates.
#
# A next-check date is a proposal of a day: it decides when the user will be
# asked something. The global rule already says to run find-tasks-by-date
# before proposing a date, but on 2026-10-17 four records were given new
# next-check dates without that look (M04 in mimikun.agent-system). The rule
# was read as covering suggestions in chat only, so a note did not reach this
# case. The failure point is the moment the date is written, so the reminder
# fires there.
#
# The records are edited through Bash (sed, heredocs, python) as often as
# through Edit/Write, so all of them are matched. Reading a record never
# triggers it: the pattern needs a date right after `next-check:`, which only
# a write carries.

set -euo pipefail

input=$(cat)
text=$(jq -r '
    .tool_input
    | [.command, .new_string, .content, (.edits // [] | .[].new_string)]
    | map(select(type == "string"))
    | join("\n")
' <<<"$input")

dates=$(grep -oE 'next-check:[[:space:]]+[0-9]{4}-[0-9]{2}-[0-9]{2}' <<<"$text" \
    | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}' | sort -u | paste -sd ' ' || true)

[ -z "$dates" ] && exit 0

context="NEXT-CHECK DATE: this write sets next-check to $dates. A next-check date decides when the user will be asked something, so it is a date proposal. Unless you already did so in this turn, call find-tasks-by-date for each of those dates and check for a clash (trips, outings, other rechecks) before relying on it. If you skipped that, say so in your reply (M04)."

jq -cn --arg c "$context" \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", additionalContext: $c}}'
