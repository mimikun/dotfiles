# Load modular configurations from conf.d
# Order is important: config.zsh must be loaded before env.zsh
source "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/config.zsh"
source "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/env.zsh"
source "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/alias.zsh"

# When migrating to zinit, replace the above with:
# zinit snippet "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/config.zsh"
# zinit snippet "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/env.zsh"
# zinit snippet "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/alias.zsh"

###################
# Shell functions #
###################

# YES/NO confirmation prompt (zsh native)
# Usage: prompt_install_confirm "tool_name" "Custom prompt message"
# Returns: 0 if user confirms (y/Y), 1 if user declines (n/N/empty)
function prompt_install_confirm() {
    local tool_name="${1:?Tool name required}"
    local prompt="${2:-Install ${tool_name}?}"

    while :; do
        # -r: Do not interpret backslash as escape character
        # ?: Prompt string
        read -r "?${prompt} [y/N]: " confirm
        case "${confirm}" in
            Y | y)
                return 0  # YES
                ;;
            '' | N | n)
                return 1  # NO
                ;;
            *)
                echo "Invalid input. Please enter y or n."
                ;;
        esac
    done
}

###############
# Setup Zinit #
###############

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Clone zinit repository if not already installed
if [[ ! -d $ZINIT_HOME/.git ]]; then
    # Cache file path (XDG Base Directory compliant)
    local zinit_install_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zinit_install_choice"

    # Show prompt only on first startup
    if [[ ! -f $zinit_install_cache ]]; then
        echo "zinit (plugin manager) is not installed."
        echo "Repository: https://github.com/zdharma-continuum/zinit"
        echo "This may take a few minutes depending on your network connection."
        echo ""

        if prompt_install_confirm "zinit" "Do you want to install zinit now?"; then
            echo "Installing zinit..."
            mkdir -p "$(dirname $ZINIT_HOME)"

            if git clone --progress https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"; then
                mkdir -p "$(dirname $zinit_install_cache)"
                echo "installed" > "$zinit_install_cache"
                echo "✓ zinit installed successfully!"
            else
                echo "✗ Failed to install zinit. Please check your network connection."
                mkdir -p "$(dirname $zinit_install_cache)"
                echo "failed" > "$zinit_install_cache"
                return 1
            fi
        else
            echo "Skipping zinit installation."
            echo "You can install it later by removing: $zinit_install_cache"
            mkdir -p "$(dirname $zinit_install_cache)"
            echo "skipped" > "$zinit_install_cache"
        fi
    fi

    # Check cache status and handle appropriately
    if [[ -f $zinit_install_cache ]]; then
        local install_status="$(cat $zinit_install_cache)"

        case "$install_status" in
            installed)
                # Installed: continue to load zinit
                ;;
            skipped|failed)
                # Skipped or failed: continue without zinit
                return 0
                ;;
        esac
    fi
fi

# Load zinit only if it exists
if [[ -d $ZINIT_HOME/.git ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
fi

# with compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

######################
# Shell integrations #
######################

#####################
# Shell completions #
#####################


# delete duplicate path
typeset -U PATH

# vim:ft=zsh.chezmoitmpl
