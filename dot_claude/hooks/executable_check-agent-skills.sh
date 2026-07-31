#!/usr/bin/env bash
# SessionStart hook: notice when an agent skill has fallen behind the CLI that
# ships it.
#
# Only skills bundled inside their own CLI are checked. Those are the ones that
# go stale silently: the CLI upgrades on its own schedule while the SKILL.md
# left on disk never changes, and the installer in
# .chezmoiscripts/linux/run_onchange_after-install-agent-skills.sh.tmpl skips
# any skill that is already present. Skills installed from a remote repo are
# not checked, because asking upstream needs the network and a SessionStart
# hook has to stay offline and fast.
#
# Notify only, never reinstall: `<cli> skills install` overwrites a file that
# chezmoi may be tracking, so that call belongs to the user.
set -uo pipefail

notices=""

# --- use-spark ---------------------------------------------------------------
# The only skill carrying a version in its front matter, so it gets a real
# comparison instead of the mtime heuristic below. It is also the only one
# chezmoi tracks, hence the extra `chezmoi add` in the suggested command.
spark_skill="$HOME/.claude/skills/use-spark/SKILL.md"
if command -v spark >/dev/null 2>&1 && [ -r "$spark_skill" ]; then
  # Read the version out of the front matter only: "version:" also appears in
  # the body, and the first body match would win.
  have=$(sed -n '2,/^---[[:space:]]*$/p' "$spark_skill" |
    sed -n 's/^[[:space:]]*version:[[:space:]]*//p' | head -n1 | tr -d '[:space:]')
  # Spark Desktop may be down; --version must not stall the session start.
  want=$(timeout 5 spark --version 2>/dev/null | head -n1 | tr -d '[:space:]')
  if [ -n "$have" ] && [ -n "$want" ] && [ "$have" != "$want" ] &&
    [ "$(printf '%s\n%s\n' "$have" "$want" | sort -V | tail -n1)" = "$want" ]; then
    notices+="- use-spark: skill is $have, spark CLI is $want."
    notices+=" Refresh: spark skill > '$spark_skill' && chezmoi add '$spark_skill'"$'\n'
  fi
fi

# --- skills with no version in their front matter -----------------------------
# Fall back to mtime: a CLI binary newer than the SKILL.md it shipped means the
# file on disk predates the running CLI. Reinstalling rewrites SKILL.md, so the
# notice clears itself and needs no cache or state file.
check_mtime() {
  local cli=$1 name=$2 reinstall=$3 skill bin
  skill="$HOME/.agents/skills/$name/SKILL.md"
  command -v "$cli" >/dev/null 2>&1 || return 0
  [ -r "$skill" ] || return 0
  bin=$(readlink -f "$(command -v "$cli")" 2>/dev/null) || return 0
  [ -n "$bin" ] && [ "$bin" -nt "$skill" ] || return 0
  notices+="- $name: the $cli binary is newer than its SKILL.md, so the skill may predate it."
  notices+=" Refresh: $reinstall"$'\n'
}

check_mtime neowright neowright "neowright skills install --global"
check_mtime officecli officecli "officecli skills install claude"

[ -n "$notices" ] || exit 0

command -v jq >/dev/null 2>&1 || exit 0

read -r -d '' msg <<EOF || true
AGENT SKILL CHECK — these skills look older than the CLI that ships them:

$notices
Report this to the user in Japanese at the very start of your first reply, and
offer to run the refresh command. This is a heuristic, not proof: for entries
detected by mtime, a CLI reinstall alone can trip it without the skill actually
having changed. Do not refresh anything unless the user asks.
EOF

printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":%s}}\n' \
  "$(jq -Rs . <<<"$msg")"
exit 0
