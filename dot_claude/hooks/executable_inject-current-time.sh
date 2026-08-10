#!/usr/bin/env bash
# UserPromptSubmit hook: put the real current time into context on every turn.
#
# Reason it is not SessionStart: the failure this replaces (M02) is not "the time
# was never known", it is "a value taken once was extrapolated from". Injecting a
# single timestamp per session reproduces exactly that, and lends it authority.
# Turn intervals are unrelated to wall-clock time — the user leaves for hours —
# so the only safe value is one measured on this turn.
set -uo pipefail

# Without jq the JSON could not be escaped safely; emitting nothing is correct,
# since the rule in rules/general.md still says to run `date`.
command -v jq >/dev/null 2>&1 || exit 0

now=$(date '+%Y-%m-%d (%a) %H:%M:%S %Z') || exit 0

read -r -d '' msg <<EOF2 || true
CURRENT TIME: $now

This was measured when this message was sent, and is the only correct value.
Do not add elapsed time to it, and do not reuse a timestamp from earlier in the
conversation — the gap between turns is unrelated to wall-clock time. If a later
point in this same reply depends on the time, run \`date\` again.
EOF2

printf '{"hookSpecificOutput":{"hookEventName":"UserPromptSubmit","additionalContext":%s}}\n' \
  "$(jq -Rs . <<<"$msg")"
exit 0
