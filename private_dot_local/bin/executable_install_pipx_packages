#!/bin/bash

task_id=$(pueue add -p -- "echo TEMP_TASK")

while read -r line; do
    echo "Install: $line"

    if [ "$1" == "--no-pueue" ]; then
        pipx install "$line"
    else
        task_id=$(pueue add --after "$task_id" -p -- "pipx install $line")
    fi
done <"$HOME/.mimikun-pkglists/linux_pipx_packages.txt"
