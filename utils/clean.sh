#!/bin/bash

# patch
rm -f ./*.patch
rm -f ./*.patch.gpg

# fish completions
rm -f dot_config/fish/completions/bd.fish
rm -f dot_config/fish/completions/docker-compose.fish
rm -f dot_config/fish/completions/docker.fish
rm -f dot_config/fish/completions/fisher.fish
rm -f dot_config/fish/completions/ghq.fish
rm -f dot_config/fish/completions/gitignore.fish
rm -f dot_config/fish/completions/spin.fish
rm -f dot_config/fish/completions/poetry.fish
rm -f dot_config/fish/completions/hwm.fish

# zip file
rm -f ./*.zip
rm -f dot_config/nvim/nvim-conf.zip
rm -f dot_vim/vim-conf.zip
