#!/bin/bash

task_id=$(pueue add -p -- "echo TEMP_TASK")

while read -r line; do
    echo "Install: $line"

    if [ "$1" == "--no-pueue" ]; then
        uv tool install "$line"
    else
        task_id=$(pueue add --after "$task_id" -p -- "uv tool install $line")
    fi
done <"$HOME/.mimikun-pkglists/linux_uv_tools.txt"
