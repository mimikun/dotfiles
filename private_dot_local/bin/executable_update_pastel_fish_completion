#!/bin/bash

COMPLETIONS_DIR="$HOME/.config/fish/completions"
CURRENT_DIR="$(pwd)"
GITHUB_REPO="sharkdp/pastel"
VERSION=$(curl --silent https://api.github.com/repos/${GITHUB_REPO}/releases/latest | jq .tag_name -r)
TAR_FILE="pastel-${VERSION}-x86_64-unknown-linux-gnu"

curl -L "https://github.com/${GITHUB_REPO}/releases/download/${VERSION}/${TAR_FILE}.tar.gz" -o "/tmp/${TAR_FILE}.tar.gz" >/dev/null 2>&1
cd /tmp || exit
tar xvf "/tmp/${TAR_FILE}.tar.gz" >/dev/null 2>&1
cd "${CURRENT_DIR}" || exit
cp "/tmp/${TAR_FILE}/autocomplete/pastel.fish" "${COMPLETIONS_DIR}/pastel.fish"
rm -rf /tmp/pastel*
