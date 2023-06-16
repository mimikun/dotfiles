#!/bin/bash

COMPLETIONS_DIR="$HOME/.config/fish/completions"
CURRENT_DIR="$(pwd)"
GITHUB_REPO="helix-editor/helix"
VERSION=$(curl --silent https://api.github.com/repos/${GITHUB_REPO}/releases/latest | jq .tag_name -r)
TAR_FILE="helix-${VERSION}-x86_64-linux"

curl -L "https://github.com/${GITHUB_REPO}/releases/download/${VERSION}/${TAR_FILE}.tar.xz" -o "/tmp/${TAR_FILE}.tar.xz" >/dev/null 2>&1
cd /tmp || exit
tar xvf "/tmp/${TAR_FILE}.tar.xz" >/dev/null 2>&1
cd "${CURRENT_DIR}" || exit
cp "/tmp/${TAR_FILE}/contrib/completion/hx.fish" "${COMPLETIONS_DIR}/hx.fish"
rm -rf /tmp/helix*
