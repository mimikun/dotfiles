#!/usr/bin/env bash
# Run a hook command only when it is actually installed.
#
# Optional tooling (rtk, lazy-tmux, git-ai) is wired into settings.json for
# every tool call. When one of them is not installed, the hook fails and the
# error is reported on each call. Skipping quietly keeps the wiring in place
# for machines where the tool exists.
#
# Usage: run-if-installed.sh <command> [args...]
set -uo pipefail

cmd="${1:-}"
[[ -n "$cmd" ]] || exit 0
shift

if [[ "$cmd" == */* ]]; then
	[[ -x "$cmd" ]] || exit 0
else
	command -v "$cmd" >/dev/null 2>&1 || exit 0
fi

exec "$cmd" "$@"
