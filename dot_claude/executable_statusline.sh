#!/usr/bin/env bash
# Claude Code status line: user@host dir [branch] HH:MM ctx NN% (NNk/NNNk)
set -uo pipefail

input=$(cat)

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
