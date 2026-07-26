#!/usr/bin/env bash
# SessionStart hook: verify that the env vars declared in settings.json actually
# exist in the installed Claude Code binary.
#
# The "env" block in settings.json is a free-form passthrough: Claude Code never
# validates the names, and emits no warning for one it does not read. An invented
# or misspelled variable therefore stays silently inert forever. Asking the binary
# directly is the only check that does not depend on documentation.
set -uo pipefail

settings="$HOME/.claude/settings.json"
cache="$HOME/.claude/.settings-env-check"

[ -r "$settings" ] || exit 0
command -v jq >/dev/null 2>&1 || exit 0

binary=${CLAUDE_CODE_EXECPATH:-$(command -v claude 2>/dev/null)}
binary=$(readlink -f "$binary" 2>/dev/null) || exit 0
[ -f "$binary" ] || exit 0

keys=$(jq -r '(.env // {}) | keys[]' "$settings" 2>/dev/null) || exit 0
[ -n "$keys" ] || exit 0

# The binary is ~275MB, so re-scan only when the binary or the declared key set
# changes. That is exactly when the answer can change: an upgrade, or an edit.
stamp=$(printf '%s\n%s\n%s' "$binary" "$(stat -c %s "$binary" 2>/dev/null)" "$keys" |
  md5sum | cut -d' ' -f1)

if [ -r "$cache" ] && [ "$(head -n1 "$cache")" = "$stamp" ]; then
  missing=$(tail -n +2 "$cache")
else
  missing=""
  while IFS= read -r k; do
    [ -n "$k" ] || continue
    grep -qaF -- "$k" "$binary" || missing+="$k"$'\n'
  done <<<"$keys"
  printf '%s\n%s' "$stamp" "$missing" >"$cache"
fi

missing=$(printf '%s' "$missing" | sed '/^$/d')
[ -n "$missing" ] || exit 0

read -r -d '' msg <<EOF || true
SETTINGS ENV CHECK — these keys in the "env" block of ~/.claude/settings.json are
not referenced anywhere in the running Claude Code binary ($binary), so they have
no effect on Claude Code itself:

$missing

Report this to the user in Japanese at the very start of your first reply, listing
the key names. A variable intended purely as a passthrough to hooks or MCP servers
is expected to show up here and is not a defect — say so rather than calling it a
mistake outright.
EOF

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":%s}}\n' \
  "$(jq -Rs . <<<"$msg")"
exit 0
