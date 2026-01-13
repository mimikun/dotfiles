###############################
# Shell environment variables #
###############################

# Global
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GHQ_ROOT="$HOME/ghq"
export PIPENV_VENV_IN_PROJECT=1
export TODAY=(date +'%Y/%m/%d')

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Others
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#Ubuntu
export PATH="/bin:$PATH"
export PATH="/usr/games:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/games:$PATH"
export PATH="/sbin:$PATH"
export PATH="/snap/bin:$PATH"
export PATH="$HOME/.fzf/bin:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.dotnet/tools/:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin/:$PATH"
export PATH="$HOME/depot_tools:$PATH"
export EDITOR=nvim
export LESS="-R"
export LESSCHARSET="utf-8"
export PAGER=less
export GIT_PAGER=less

# chezmoi
export CHEZMOI_DIR="$XDG_DATA_HOME/chezmoi"

# starship config
export STARSHIP_CONFIG_DIR="$XDG_CONFIG_HOME/starship"
export STARSHIP_CONFIG="$STARSHIP_CONFIG_DIR/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# spaceship config
export SPACESHIP_PLUGIN_PATH="$HOME/.zsh/spaceship/spaceship.zsh"
export SPACESHIP_CONFIG_DIR="$XDG_CONFIG_HOME/spaceship"
export SPACESHIP_CONFIG="$SPACESHIP_CONFIG_DIR/spaceship.zsh"

# pure config
export PURE_PATH="$HOME/.zsh/pure"

# luarocks
export PATH="$HOME/.luarocks/bin:$PATH"
export LUA_PATH="/usr/local/share/lua/5.3/?.lua;/usr/local/share/lua/5.3/?/init.lua;/usr/local/lib/lua/5.3/?.lua;/usr/local/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua;$HOME/.luarocks/share/lua/5.3/?.lua;$HOME/.luarocks/share/lua/5.3/?/init.lua"
export LUA_CPATH="/usr/local/lib/lua/5.3/?.so;/usr/local/lib/lua/5.3/loadall.so;./?.so;$HOME/.luarocks/lib/lua/5.3/?.so"

# aqua
export AQUA_ROOT_DIR="$XDG_DATA_HOME/aqua"
export AQUA_CONFIG_DIR="$XDG_CONFIG_HOME/aqua"
export AQUA_BIN="$AQUA_ROOT_DIR/bin"
export PATH="$AQUA_BIN:$PATH"

# sheldon
export SHELDON_CONFIG_DIR="$XDG_CONFIG_HOME/sheldon/zsh"
export SHELDON_DATA_DIR="$XDG_DATA_HOME/sheldon/zsh"

# PHP composer
export COMPOSER_CONFIG_HOME="$XDG_CONFIG_HOME/composer"
export COMPOSER_BIN_DIR="$COMPOSER_CONFIG_HOME/vendor/bin"
export PATH="$COMPOSER_BIN_DIR:$PATH"

# Julia
export PATH="$HOME/.juliaup/bin:$PATH"

# mocword dict
export MOCWORD_DATA="$XDG_CACHE_HOME/mocword.sqlite"

# neovim version manager

# bob-nvim
export BOB_CONFIG="$XDG_CONFIG_HOME/bob/config.toml"
export BOB_BIN_DIR="$XDG_DATA_HOME/bob/nvim-bin"

# nvs
export NVS_BIN_DIR="$XDG_DATA_HOME/nvs/bin"

if [[ "$USE_NVIM_VERSION_MANAGER" == "bob" ]]; then
    export PATH="$BOB_BIN_DIR:$PATH"
fi

if [[ "$USE_NVIM_VERSION_MANAGER" == "nvs" ]]; then
    export PATH="$NVS_BIN_DIR:$PATH"
fi

# age public keys
export AGE_PUBKEY_HOME="age1cktdwc8u4z76kawluyswaruyeg7eg6078rw3t0kkmx5wqkk40d2qzajn8y"
export AGE_PUBKEY_WORK="age1n03v0casqk2djs2jw3xq5ldpdjtp2s6r0u3uhtmd7zv9j2xuyf6qpl9x7l"
# TODO: config
export AGE_PUBKEY_AZUSA=""

# golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Neovide env-vars
## Functionality
### Frame
#export NEOVIDE_FRAME="full"
#export NEOVIDE_FRAME="none"
# macOS Only
#export NEOVIDE_FRAME="transparent"
# macOS Only
#export NEOVIDE_FRAME="buttonless"

### Maximized
# NOTE: not documented
#export NEOVIDE_MAXIMIZED=true

### Multigrid
# NOTE: not documented
#export NEOVIDE_NO_MULTIGRID=true

### Fork
#export NEOVIDE_FORK=0

### No Idle
#export NEOVIDE_IDLE=0

### Title
# macOS Only
# NOTE: not documented
#export NEOVIDE_TITLE_HIDDEN=false

### sRGB
#export NEOVIDE_SRGB=0

### Tabs
#export NEOVIDE_TABS=0

### No VSync
#export NEOVIDE_VSYNC=0

### Neovim Binary
#export NEOVIM_BIN="/path/to/nvim"

### Wayland / X11
# Linux Only
# NOTE: Incomprehensible
#export NEOVIDE_APP_ID="wayland_app_id"
#export NEOVIDE_WM_CLASS_INSTANCE="x11_wm_class_instance"
#export NEOVIDE_WM_CLASS="x11_wm_class"

# nimble
export PATH="$HOME/.nimble/bin:$PATH"

# fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

# mise
alias paleovim="$XDG_DATA_HOME/mise/installs/vim/ref-master/bin/vim"
alias pvim=paleovim

# zettelkasten
export zettelkasten_root="$GHQ_ROOT/codeberg.org/mimikun/zettelkasten"

# depot
export DEPOT_INSTALL_DIR="$HOME/.depot/bin"
export PATH="$DEPOT_INSTALL_DIR:$PATH"

# cache dir
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# vim:ft=zsh
