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

# handler
if command -v handler >/dev/null 2>&1; then
    eval "$(_HANDLER_COMPLETE=zsh_source handler)"
fi

# pass-cli 
if command -v pass-cli >/dev/null 2>&1; then
    eval "$(pass-cli completion zsh)"
fi

# lazyworktree
if command -v lazyworktree >/dev/null 2>&1; then
    eval "$(lazyworktree completion zsh --code)"
fi

# worktrunk
if command -v worktrunk >/dev/null 2>&1; then
    eval "$(wt config shell init zsh)"
fi

# git-wt
if command -v git-wt >/dev/null 2>&1; then
    eval "$(git wt --init zsh)"
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

