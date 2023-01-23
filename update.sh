#!/bin/bash

cp ~/.config/fish/completions/* ./dot_config/fish/completions/
cp ~/.config/fish/fish_plugins ./dot_config/fish/fish_plugins
chezmoi add ~/.tool-versions
chezmoi add ~/asdf_plugin_list.txt
chezmoi add ~/cargo_packages.txt
