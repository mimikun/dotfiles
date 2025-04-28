#!/bin/bash

while read -r line; do
    echo "Install: $line"
    pueue add -- "gh extension install $line"
done <"$HOME/.mimikun-pkglists/gh_extension_list.txt"
