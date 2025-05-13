# fish prompts

# tide

https://github.com/IlanCosman/tide

Not for me for the following reasons:

- Cannot easily switch

### Install

```fish
fisher install ilancosman/tide@v6
```

### Config script

touch `$CHEZMOI_ROOT/.chezmoiscripts/linux/run_onchange_after-install-tide-fish.sh.tmpl`

```bash
{{ if eq .chezmoi.os "linux" -}}

#!/bin/bash

# TODO: it
readonly TIDE_STYLE=Classic
readonly TIDE_PROMPT_COLORS #--prompt_colors='True color'
readonly TIDE_CLASSIC_PROMPT_COLOR=Light
readonly TIDE_SHOW_TIME #--show_time='24-hour format'
readonly TIDE_CLASSIC_PROMPT_SEPARATORS=Angled
readonly TIDE_POWERLINE_PROMPT_HEADS=Round
readonly TIDE_POWERLINE_PROMPT_TAILS=Round
readonly TIDE_POWERLINE_PROMPT_STYLE #--powerline_prompt_style='Two lines, character'
readonly TIDE_PROMPT_CONNECTION=Disconnected
readonly TIDE_POWERLINE_RIGHT_PROMPT_FRAME=No
readonly TIDE_PROMPT_CONNECTION_ANDOR_FRAME_COLOR=Light
readonly TIDE_PROMPT_SPACING=Sparse
readonly TIDE_ICONS #--icons='Many icons'
readonly TIDE_TRANSIENT=No

echo "Install tide..."
fish -c "fisher install IlanCosman/tide@v6"
echo "Configure tide..."
fish -c "tide configure --auto --style=$TIDE_STYLE --prompt_colors='True color' --classic_prompt_color=$TIDE_CLASSIC_PROMPT_COLOR --show_time='24-hour format' --classic_prompt_separators=$TIDE_CLASSIC_PROMPT_SEPARATORS --powerline_prompt_heads=$TIDE_POWERLINE_PROMPT_HEADS --powerline_prompt_tails=$TIDE_POWERLINE_PROMPT_TAILS --powerline_prompt_style='Two lines, character' --prompt_connection=$TIDE_PROMPT_CONNECTION --powerline_right_prompt_frame=$TIDE_POWERLINE_RIGHT_PROMPT_FRAME --prompt_connection_andor_frame_color=$TIDE_PROMPT_CONNECTION_ANDOR_FRAME_COLOR --prompt_spacing=$TIDE_PROMPT_SPACING --icons='Many icons' --transient=$TIDE_TRANSIENT"
#fish -c "tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time='24-hour format' --classic_prompt_separators=Angled --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character' --prompt_connection=Disconnected --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Light --prompt_spacing=Sparse --icons='Many icons' --transient=No"

{{ end -}}
```

### Uninstall

```fish
fisher remove ilancosman/tide@v6
```

# hydro

https://github.com/jorgebucaran/hydro

Not for me for the following reasons:

- Too simple


### Install

```fish
fisher install jorgebucaran/hydro
```

### Config

Can you use Universal-vars config

```fish
# Symbols
set -Ux hydro_symbol_start ""
set -Ux hydro_symbol_prompt "❱"
set -Ux hydro_symbol_git_dirty "•"
set -Ux hydro_symbol_git_ahead "↑"
set -Ux hydro_symbol_git_behind "↓"
# ColUors
set -Ux hydro_color_pwd $fish_color_normal
set -Ux hydro_color_git $fish_color_normal
set -Ux hydro_color_start $fish_color_normal
set -Ux hydro_color_error $fish_color_error
set -Ux hydro_color_prompt $fish_color_normal
set -Ux hydro_color_duration $fish_color_normal
# FlaUgs
set -Ux hydro_fetch false
set -Ux hydro_multiline false
# MisUc
set -Ux fish_prompt_pwd_dir_length 1
set -Ux hydro_ignored_git_paths ""
set -Ux hydro_cmd_duration_threshold 1000
```

### Uninstall

```fish
fisher remove jorgebucaran/hydro
```

# pure

https://github.com/pure-fish/pure

Not for me for the following reasons:

<!-- TODO: fish-pure -->
- hogehoge

### Install

```fish
fisher install pure-fish/pure
```

### Config script

Can you use Universal-vars config

```fish
# Check For New Release
set -U pure_check_for_new_release false

# Container Detection (Docker)
set -U pure_enable_container_detection true
#set -U pure_symbol_container_prefix

# Current Working Directory
set -U pure_begin_prompt_with_current_directory true # true: pwd, git, SSH
#set -U pure_begin_prompt_with_current_directory false # false: SSH, pwd, git
set -U pure_shorten_prompt_current_directory_length 0
set -U pure_truncate_prompt_current_directory_keeps 0

# Git
set -U pure_enable_git true
set -U pure_symbol_git_dirty "*"
set -U pure_symbol_git_stash "≡"
#set -U PURE_GIT_DOWN_ARROW "↓"
set -U pure_symbol_git_unpulled_commits "⇣"
#set -U PURE_GIT_UP_ARROW "↑"
set -U pure_symbol_git_unpushed_commits "⇡"

# Jobs
set -U pure_show_jobs false

# Kubernetes
#set -U pure_symbol_k8s_prefix "☸"
set -U pure_symbol_k8s_prefix "󱃾"
set -U pure_enable_k8s false

# NixOS
# Indicate if nix develop shell is activated in their prompt.
set -U pure_enable_nixdevshell false # Indicate if a nix develop shell is activated (based on IN_NIX_SHELL).
#set -U pure_symbol_nixdevshell_prefix "❄️"
set -U pure_symbol_nixdevshell_prefix "󱄅"
set -U pure_color_nixdevshell_prefix $pure_color_info
set -U pure_color_nixdevshell_symbol $pure_color_mute

# Prompt Symbol
#set -U PURE_PROMPT_SYMBOL "»"
set -U PURE_PROMPT_SYMBOL "❯"
set -U pure_symbol_prompt $PURE_PROMPT_SYMBOL

# Python Virtualenv
set -U PURE_VENV_SYMBOL "󰌠"
set -U pure_enable_virtualenv true
set -U pure_symbol_virtualenv_prefix $PURE_VENV_SYMBOL

# AWS Profile
set -U PURE_AWS_SYMBOL "󰸏"
set -U pure_enable_aws_profile true
set -U pure_symbol_aws_profile_prefix $PURE_AWS_SYMBOL

# Separate Error Symbol
set -U pure_separate_prompt_on_error false

# Single Line Prompt
set -U pure_enable_single_line_prompt false

# SSH Session
set -U PURE_SSH_SYMBOL "󰣀"
set -U pure_symbol_ssh_prefix $PURE_SSH_SYMBOL

# Time & Duration
set -U pure_show_system_time false
set -U pure_show_subsecond_command_duration false
set -U pure_threshold_command_duration 5

# Title
set -U pure_symbol_title_bar_separator "-"
set -U pure_shorten_window_title_current_directory_length 0
set -U pure_truncate_window_title_current_directory_keeps 0

# VI Mode
set -U PURE_REVERSE_PROMPT_SYMBOL "❮"
set -U pure_reverse_prompt_symbol_in_vimode true # true: ❮ indicate a non-insert mode.
#set -U pure_reverse_prompt_symbol_in_vimode false # false: indicate vi mode with [I], [N], [V].
set -U pure_symbol_reverse_prompt $PURE_REVERSE_PROMPT_SYMBOL

# Working as Root
set -U PURE_ROOT_SYMBOL "#"
#set -U pure_show_prefix_root_prompt true # true: shows prompt prefix when logged in as root.
set -U pure_show_prefix_root_prompt false # false: no shows prompt prefix when logged in as root.
set -U pure_symbol_prefix_root_prompt $PURE_ROOT_SYMBOL
```

### Uninstall

```fish
fisher remove pure-fish/pure
```

