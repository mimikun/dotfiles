#!/bin/bash

function existsCmd() {
    type -a "$1" >/dev/null 2>&1
}

while read -r line; do
    if ! existsCmd "$line"; then
        echo "$line is not found"
        pueue add -- "pip install $line"
    fi
done <~/linux_pip_packages.txt
