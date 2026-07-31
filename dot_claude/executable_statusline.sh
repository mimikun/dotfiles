#!/usr/bin/env bash
# Claude Code status line dispatcher.
#
# CLAUDE_STATUSLINE picks the renderer:
#   builtin (default) - the shell implementation below
#   cship             - hand the payload to the cship binary
#   ccstatusline      - hand the payload to the ccstatusline binary
#
# Set it from fish with `set -Ux CLAUDE_STATUSLINE cship`; the universal
# variable is exported, so this bash script sees it as a plain env var.
# An unknown value, or a cship that is not installed, falls back to builtin
# rather than leaving the status line blank.
set -uo pipefail

input=$(cat)

# builtin: user@host dir [branch] HH:MM ctx NN% (NNk/NNNk)
render_builtin() {
  local current_dir used_pct used_tokens window_size branch ctx ctx_color host

  IFS=$'\t' read -r current_dir used_pct used_tokens window_size <<<"$(
    printf '%s' "$input" | jq -r '
      [ (.workspace.current_dir // .cwd // "."),
        (.context_window.used_percentage // -1),
        (.context_window.total_input_tokens // 0),
        (.context_window.context_window_size // 0)
      ] | @tsv'
  )"

  branch=$(git -C "$current_dir" branch --show-current 2>/dev/null || echo 'no-git')
  [ -n "$branch" ] || branch='detached'

  # Context usage: green under 60%, yellow under 85%, red beyond.
  if [ "$used_pct" -lt 0 ]; then
    ctx=$'\033[2mctx --\033[0m'
  else
    if [ "$used_pct" -lt 60 ]; then
      ctx_color=32
    elif [ "$used_pct" -lt 85 ]; then
      ctx_color=33
    else
      ctx_color=31
    fi
    ctx=$(printf '\033[%sm%s%% (%dk/%dk)\033[0m' \
      "$ctx_color" "$used_pct" "$((used_tokens / 1000))" "$((window_size / 1000))")
  fi

  # `hostname` is absent on some machines (e.g. WSL images without net-tools).
  host=$(hostname -s 2>/dev/null || uname -n)
  host=${host%%.*}

  printf '\033[2m%s@%s \033[36m%s\033[0m \033[33m[%s]\033[0m \033[2m%s\033[0m %s' \
    "$(whoami)" "$host" "$(basename "$current_dir")" "$branch" "$(date +%H:%M)" "$ctx"
}

# External renderers take the same stdin payload and carry their own config:
# cship reads ~/.config/cship.toml, ccstatusline ~/.config/ccstatusline/settings.json.
render_external() {
  printf '%s' "$input" | "$1"
}

renderer=${CLAUDE_STATUSLINE:-builtin}

case "$renderer" in
  cship | ccstatusline)
    if command -v "$renderer" >/dev/null 2>&1; then
      render_external "$renderer"
    else
      render_builtin
    fi
    ;;
  *)
    render_builtin
    ;;
esac
