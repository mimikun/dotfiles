#!/bin/bash

COMPLETIONS_DIR="$HOME/.config/fish/completions"
CURRENT_DIR="$(pwd)"
RG_REPO="BurntSushi/ripgrep"
RG_VERSION=$(curl --silent https://api.github.com/repos/${RG_REPO}/releases/latest | jq .tag_name -r)
RG_TAR_FILE="ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl"

curl -L "https://github.com/${RG_REPO}/releases/download/${RG_VERSION}/${RG_TAR_FILE}.tar.gz" -o "/tmp/${RG_TAR_FILE}.tar.gz" >/dev/null 2>&1
cd /tmp || exit
and tar xvf "/tmp/${RG_TAR_FILE}.tar.gz" >/dev/null 2>&1
cd "${CURRENT_DIR}" || exit
cp "/tmp/${RG_TAR_FILE}/complete/rg.fish" "${COMPLETIONS_DIR}/rg.fish"
rm -rf /tmp/ripgrep*
