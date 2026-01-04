# sheldon
if command -v sheldon>/dev/null 2>&1; then
    if [[ "$USE_ZSH_PM" == "sheldon" ]]; then
        eval "$(sheldon source)"
    fi
fi

# Ghostty shell integration for Zsh
#if test -n "${GHOSTTY_RESOURCES_DIR}"; then
#    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
#fi

# Ghostty shell integration for Zsh
GHOSTTY_REPO_S_GHOSTTY_RESOURCES_DIR="$GHQ_ROOT/github.com/ghostty-org/ghostty/src"
if test -n "${GHOSTTY_REPO_S_GHOSTTY_RESOURCES_DIR}"; then
    if test -d "${GHOSTTY_REPO_S_GHOSTTY_RESOURCES_DIR}"; then
        builtin source "${GHOSTTY_REPO_S_GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
    fi
fi

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

# zoxide
if command -v zoxide>/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# pnpm
if command -v pnpm>/dev/null 2>&1; then
    eval "$(pnpm completion zsh)"
fi

# broot
# TODO: Use zsh integration
if command -v broot>/dev/null 2>&1; then
    source "$XDG_CONFIG_HOME/broot/launcher/bash/br"
fi

# Rye
if command -v rye>/dev/null 2>&1; then
    source "$HOME/.rye/env"
fi

# Linuxbrew
if command -v brew>/dev/null 2>&1; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# walk
function lk {
  cd "$(walk "$@")"
}

# mise
eval "$(mise activate zsh)"

# inshellisense
#if test -f ~/.inshellisense/key-bindings.zsh
#then
#    source ~/.inshellisense/key-bindings.zsh
#fi

# mdbook
if command -v mdbook>/dev/null 2>&1; then
    eval "$(mdbook completions zsh)"
fi

# atuin
if command -v atuin>/dev/null 2>&1; then
    eval "$(atuin init zsh)"
    atuin gen-completions --shell zsh
fi

# rebar3
if command -v rebar3 >/dev/null 2>&1; then
    export PATH="$XDG_CACHE_HOME/rebar3/bin:$PATH"
fi

# pay-respects
eval "$(pay-respects zsh --alias)"

# TODO: fix it
# jujutsu
#jj util completion zsh

# TODO: fix it
# sunbeam
#sunbeam completion zsh


# vfox
# NOTE: can't use it now
#eval "$(vfox activate zsh)"

# srgn
if command -v srgn >/dev/null 2>&1; then
    eval "$(srgn --completions zsh)"
fi

# go-task
if command -v task >/dev/null 2>&1; then
    eval "$(task --completion zsh)"
fi

# pixi
if command -v pixi >/dev/null 2>&1; then
    eval "$(pixi completion --shell zsh)"
fi

# intelli-shell
if command -v intelli-shell >/dev/null 2>&1; then
    eval "$(intelli-shell init zsh)"
fi

# pymobiledevice3
if command -v pymobiledevice3 >/dev/null 2>&1; then
    if [ -f "$HOME/.pymobiledevice3.zsh" ]; then
        source "$HOME/.pymobiledevice3.zsh"
    fi
fi

# ghtkn
if command -v ghtkn >/dev/null 2>&1; then
    eval "$(ghtkn completion zsh)"
fi

# jiratui
if command -v jiratui >/dev/null 2>&1; then
    eval "$(jiratui completions zsh)"
fi

# gup
if command -v gup >/dev/null 2>&1; then
    eval "$(gup completion zsh)"
fi

# tombi
if command -v tombi >/dev/null 2>&1; then
    eval "$(tombi completion zsh)"
fi

# vectorcode
if command -v vectorcode >/dev/null 2>&1; then
    eval "$(vectorcode --print-completion zsh)"
fi

# tod
if command -v tod >/dev/null 2>&1; then
    eval "$(tod shell completions zsh)"
fi

# dotter
if command -v dotter >/dev/null 2>&1; then
    eval "$(dotter gen-completions --shell zsh)"
fi

# ghciwatch
if command -v ghciwatch >/dev/null 2>&1; then
    eval "$(ghciwatch --completions zsh)"
fi

# crush
if command -v crush >/dev/null 2>&1; then
    source <(crush completion zsh)
fi

# jump
if command -v jump >/dev/null 2>&1; then
    eval "$(jump shell)"
fi

# wtp
if command -v wtp >/dev/null 2>&1; then
    #eval "$(wtp shell-init zsh)"
fi

# turm
if command -v turm >/dev/null 2>&1; then
    eval "$(turm completion zsh)"
fi

# dnspyre
if command -v dnspyre >/dev/null 2>&1; then
    eval "$(dnspyre --completion-script-zsh)"
fi

# ty
if command -v ty >/dev/null 2>&1; then
    eval "$(ty generate-shell-completion zsh)"
fi

# TODO: Use plugin manager
# cute
# e.g. https://github.com/mattmc3/antidote
#antidote install ras0q/cute

CUTE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cute"
if [ ! -d "$CUTE_DIR" ]; then
  git clone https://github.com/ras0q/cute "$CUTE_DIR"
fi
source "$CUTE_DIR/cute"


#[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

