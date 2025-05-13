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

