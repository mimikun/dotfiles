#!/bin/sh

# Create vim colors directory
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.vim/colors/

# Install vim-monokai
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -O ~/.vim/colors/monokai.vim
wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -O ~/.config/nvim/colors/monokai.vim

# Install vim-molokai
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.vim/colors/molokai.vim
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -O ~/.config/nvim/colors/molokai.vim

# Install asdf completions for fish-shell
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

