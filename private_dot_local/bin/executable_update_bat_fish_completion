#!/bin/bash

COMPLETIONS_DIR="$HOME/.config/fish/completions"
CURRENT_DIR="$(pwd)"
BAT_REPO="sharkdp/bat"
BAT_VERSION=$(curl --silent https://api.github.com/repos/${BAT_REPO}/releases/latest | jq .tag_name -r)
BAT_TAR_FILE="bat-${BAT_VERSION}-x86_64-unknown-linux-gnu"

curl -L "https://github.com/${BAT_REPO}/releases/download/${BAT_VERSION}/${BAT_TAR_FILE}.tar.gz" -o "/tmp/${BAT_TAR_FILE}.tar.gz" >/dev/null 2>&1
cd /tmp || exit
and tar xvf "/tmp/${BAT_TAR_FILE}.tar.gz" >/dev/null 2>&1
cd "${CURRENT_DIR}" || exit
cp "/tmp/${BAT_TAR_FILE}/autocomplete/bat.fish" "${COMPLETIONS_DIR}/bat.fish"
rm -rf /tmp/bat*
