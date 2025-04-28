#!/bin/bash

task_id=$(pueue add -p -- "echo TEMP_TASK")

while read -r line; do
    echo "Install: $line"

    if [ "$1" == "--no-pueue" ]; then
        gh extension install "$line"
    else
        task_id=$(pueue add --after "$task_id" -p -- "gh extension install $line")
    fi
done <"$HOME/.mimikun-pkglists/gh_extension_list.txt"
