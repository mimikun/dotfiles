#!/bin/bash

host_name=$(cat /etc/hostname)

# fish
cp ~/.config/fish/completions/* ./dot_config/fish/completions/
cp ~/.config/fish/fish_plugins ./dot_config/fish/fish_plugins

# mise
chezmoi add ~/.mise.toml
chezmoi add ~/.config/mise/config.toml
chezmoi add ~/.config/mise/settings.toml

# cargo packages
chezmoi add ~/linux_cargo_packages.txt

# pip packages
chezmoi add ~/linux_pip_packages.txt

# Brewfile
chezmoi add ~/Brewfile

# go packages (managed by gup)
chezmoi add ~/.config/gup/gup.conf

# managed by aqua
chezmoi add ~/.config/aqua/aqua.yaml
chezmoi add ~/.config/aqua/policy.yaml
chezmoi add ~/.config/aqua/registry.yaml

# lazy.nvim lockfile
chezmoi add ~/.config/nvim/lazy-lock.json

# mason.nvim lockfile (mason-lock.nvim)
chezmoi add ~/.config/nvim/mason-lock.json

# dotfyle.json
chezmoi add ~/.config/nvim/dotfyle.json
deno fmt dot_config/nvim/dotfyle.json

# ~/.local/bin/*
chezmoi add ~/.local/bin/chezmoi_post_apply_hook
chezmoi add ~/.local/bin/chezmoi_pre_apply_hook
chezmoi add ~/.local/bin/editorconfig
chezmoi add ~/.local/bin/generate_cargo_package_list
chezmoi add ~/.local/bin/generate_pip_package_list
chezmoi add ~/.local/bin/git-amend-commit
chezmoi add ~/.local/bin/git-browse
chezmoi add ~/.local/bin/git-hash
chezmoi add ~/.local/bin/git-ignore
chezmoi add ~/.local/bin/install_cargo_packages
chezmoi add ~/.local/bin/install_gh_extensions
chezmoi add ~/.local/bin/install_pip_packages
chezmoi add ~/.local/bin/lk
chezmoi add ~/.local/bin/numeronym
chezmoi add ~/.local/bin/pcd
chezmoi add ~/.local/bin/pueue_update_cargo_packages
chezmoi add ~/.local/bin/pueue_update_pip_packages
chezmoi add ~/.local/bin/re_boot
chezmoi add ~/.local/bin/read_confirm
chezmoi add ~/.local/bin/shut_down
chezmoi add ~/.local/bin/update_bat_fish_completion
chezmoi add ~/.local/bin/update_cargo_packages
chezmoi add ~/.local/bin/update_chromedriver
chezmoi add ~/.local/bin/update_docker_compose
chezmoi add ~/.local/bin/update_fish_completions
chezmoi add ~/.local/bin/update_geckodriver
chezmoi add ~/.local/bin/update_helix_fish_completion
chezmoi add ~/.local/bin/update_mise
chezmoi add ~/.local/bin/update_pip_packages
chezmoi add ~/.local/bin/update_pnpm
chezmoi add ~/.local/bin/update_poetry
chezmoi add ~/.local/bin/update_twitch_cli
chezmoi add ~/.local/bin/vup
chezmoi add ~/.local/bin/wsl-open

# ArchLinux configs
# HOSTNAME = azusa ONLY
if [ "$host_name" = "azusa" ]; then
    chezmoi add ~/.config/i3/config
    chezmoi add ~/.config/i3status-rust/config.toml
    chezmoi add ~/.config/fcitx5/config
    chezmoi add ~/.config/betterlockscreen/betterlockscreenrc
    chezmoi add ~/.config/polybar/config.ini
    #chezmoi add ~/.config/rofi/config.rasi
    chezmoi add ~/.config/flameshot/flameshot.ini

    chezmoi add ~/.xinitrc
    chezmoi add ~/.xmodmap
    chezmoi add ~/.Xresources
fi
