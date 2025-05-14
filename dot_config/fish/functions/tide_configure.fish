function tide_configure --description 'tide configure helper function'
    tide configure --auto \
        --style=$TIDE_STYLE \
        --prompt_colors=$TIDE_PROMPT_COLORS \
        --classic_prompt_color=$TIDE_CLASSIC_PROMPT_COLOR \
        --show_time=$TIDE_SHOW_TIME \
        --classic_prompt_separators=$TIDE_CLASSIC_PROMPT_SEPARATORS \
        --powerline_prompt_heads=$TIDE_POWERLINE_PROMPT_HEADS \
        --powerline_prompt_tails=$TIDE_POWERLINE_PROMPT_TAILS \
        --powerline_prompt_style=$TIDE_POWERLINE_PROMPT_STYLE \
        --prompt_connection=$TIDE_PROMPT_CONNECTION \
        --powerline_right_prompt_frame=$TIDE_POWERLINE_RIGHT_PROMPT_FRAME \
        --prompt_connection_andor_frame_color=$TIDE_PROMPT_CONNECTION_ANDOR_FRAME_COLOR \
        --prompt_spacing=$TIDE_PROMPT_SPACING \
        --icons=$TIDE_ICONS \
        --transient=$TIDE_TRANSIENT
end
