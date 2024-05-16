#!/bin/bash

while read -r line; do
    gh extension install "$line"
    sleep 1
done <"$HOME/.mimikun-pkglists/gh_extension_list.txt"
