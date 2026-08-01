#!/usr/bin/env bash
# PreToolUse hook (matcher: the Todoist write tools) — inject the sync rule and
# point at the todoist skill.
#
# Not a guard. It reads no input, decides nothing, and never denies; it prints
# additionalContext so the rule is in front of the model at call time rather
# than only in CLAUDE.md, which may have scrolled far out of attention.
#
# It also names the `todoist` skill. Skills fire on the model reading their
# description, which is not something a tool call can force; this hook is the
# only deterministic trigger available at write time, so it carries the pointer.
#
# The rule exists because the user also edits Todoist from the desktop and
# mobile apps, so any listing fetched earlier in the session can be stale by
# the time a write goes out.
#
# There is nothing here to regression-test, which is why the suite has no cases
# for it. Changing the text is safe; producing invalid JSON is not, so the
# payload is built with jq rather than written out by hand.

set -euo pipefail

read -r -d '' context <<'EOF' || true
TODOIST SYNC RULE: the user also edits Todoist from desktop and mobile apps, so any listing fetched earlier in this session may already be stale. (1) BEFORE this write, re-fetch the target with find-tasks / get-overview unless you already did so in this same turn. (2) AFTER the write, re-fetch the same query and verify by count before claiming completion. (3) If this write creates or rewords a task and you have not already loaded the `todoist` skill in this session, load it now — it holds the end-condition format the task has to carry, and a task written without it has to be rewritten.
EOF

jq -cn --arg c "$context" \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", additionalContext: $c}}'
