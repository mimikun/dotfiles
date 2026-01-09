# NOTE: shell prompt
# starship
if command -v starship >/dev/null 2>&1; then
    if [[ "$USE_SHELL_PROMPT" == "starship" ]]; then
        eval "$(starship init zsh)"
    fi
fi

# oh-my-posh
if command -v oh-my-posh >/dev/null 2>&1; then
    if [[ "$USE_SHELL_PROMPT" == "oh-my-posh" ]]; then
    eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/refs/heads/main/themes/tokyonight_storm.omp.json')"
    fi
fi

# spaceship
if [[ "$USE_SHELL_PROMPT" == "spaceship" ]]; then
    source "$SPACESHIP_PLUGIN_PATH"
fi

# pure
if [[ "$USE_SHELL_PROMPT" == "pure" ]]; then
    fpath+=($HOME/.zsh/pure)
    autoload -U promptinit; promptinit
    # pure config begin

    PURE_CMD_MAX_EXEC_TIME=5
    PURE_GIT_PULL=1
    PURE_GIT_UNTRACKED_DIRTY=1
    PURE_GIT_DELAY_DIRTY_CHECK=1800 # 30 min
    PURE_PROMPT_SYMBOL="❯"
    PURE_PROMPT_VICMD_SYMBOL="❮"
    PURE_GIT_DOWN_ARROW="⇣"
    PURE_GIT_UP_ARROW="⇡"
    PURE_GIT_STASH_SYMBOL="≡"

    # show git-stash status
    zstyle :prompt:pure:git:stash show yes

    # if use nix-shell
    zstyle :prompt:pure:environment:nix-shell show no

    # pure config end
    prompt pure
fi

