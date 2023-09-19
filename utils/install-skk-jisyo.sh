#!/bin/bash

current_dir=$(pwd)
SKK_JISYO_DIR="$HOME/.skk"
if [ ! -d "$SKK_JISYO_DIR" ]; then
    mkdir -p "$SKK_JISYO_DIR"
fi

if read_confirm; then
    cd /tmp || exit
    wget https://skk-dev.github.io/dict/SKK-JISYO.L.gz
    gzip -d SKK-JISYO.L.gz
    cp SKK-JISYO.L ~/.skk/SKK-JISYO.L
    cd "$current_dir" || exit
fi
