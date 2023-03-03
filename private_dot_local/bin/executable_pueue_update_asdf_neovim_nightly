#!/bin/bash

NVIM_VERSION=$(nvim --version | head -n 1 | tr " " "\n" | sed -n '2p')
NVIM_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

if [ "$NVIM_VERSION" != "$NVIM_NEW_VERSION" ]; then
  echo "neovim (latest)nightly found!"
  asdf uninstall neovim nightly
  pueue add -- 'asdf install neovim nightly'
else
  echo "neovim (latest)nightly is already installed"
  echo "version: $NVIM_VERSION"
fi
