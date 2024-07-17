#!/bin/bash

while read -r line; do
    echo "Install: $line"
    pueue add -- "pipx install $line"
done <"$HOME/.mimikun-pkglists/linux_pipx_packages.txt"
