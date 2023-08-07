#!/bin/bash

# fish
cp ~/.config/fish/completions/* ./dot_config/fish/completions/
cp ~/.config/fish/fish_plugins ./dot_config/fish/fish_plugins

# asdf-vm
chezmoi add ~/.tool-versions
chezmoi add ~/asdf_plugin_list.txt

# cargo packages
chezmoi add ~/cargo_packages.txt

# Brewfile
chezmoi add ~/Brewfile

# go packages (managed by gup)
chezmoi add ~/.config/gup/gup.conf

# lazy.nvim lockfile
chezmoi add ~/.config/nvim/lazy-lock.json

# ~/.local/bin/*
chezmoi add ~/.local/bin/generate_cargo_package_list
chezmoi add ~/.local/bin/git-ammend-commit
chezmoi add ~/.local/bin/git-browse
chezmoi add ~/.local/bin/git-hash
chezmoi add ~/.local/bin/git-ignore
chezmoi add ~/.local/bin/install_asdf_plugins
chezmoi add ~/.local/bin/install_cargo_packages
chezmoi add ~/.local/bin/install_gh_extensions
chezmoi add ~/.local/bin/numeronym
chezmoi add ~/.local/bin/pcd
chezmoi add ~/.local/bin/pueue_update_asdf_neovim_nightly
chezmoi add ~/.local/bin/pueue_update_asdf_zig_master
chezmoi add ~/.local/bin/pueue_update_cargo_packages
chezmoi add ~/.local/bin/re_boot
chezmoi add ~/.local/bin/read_confirm
chezmoi add ~/.local/bin/shut_down
chezmoi add ~/.local/bin/update_asdf_neovim_nightly
chezmoi add ~/.local/bin/update_asdf_zig_master
chezmoi add ~/.local/bin/update_bat_fish_completion
chezmoi add ~/.local/bin/update_cargo_packages
chezmoi add ~/.local/bin/update_chromedriver
chezmoi add ~/.local/bin/update_docker_compose
chezmoi add ~/.local/bin/update_fish_completions
chezmoi add ~/.local/bin/update_geckodriver
chezmoi add ~/.local/bin/update_helix_fish_completion
chezmoi add ~/.local/bin/update_pnpm
chezmoi add ~/.local/bin/update_ripgrep_fish_completion
chezmoi add ~/.local/bin/update_twitch_cli
chezmoi add ~/.local/bin/vup
chezmoi add ~/.local/bin/vupueue
chezmoi add ~/.local/bin/update_twitch_cli
