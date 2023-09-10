#!/bin/bash

VERSION=$("$ASDF_DIR/installs/neovim/stable/bin/nvim" --version | head -n 1 | tr " " "\n" | sed -n '2p')
NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

if [ "$VERSION" != "$NEW_VERSION" ]; then
  echo "Update neovim (latest)stable!"
  asdf uninstall neovim stable
  asdf install neovim stable
else
  echo "neovim (latest)stable is already installed"
  echo "version: $VERSION"
fi
