#!/bin/bash

function existsCmd() {
    type -a "$1" >/dev/null 2>&1
}

task_id=$(pueue add -p -- "echo TEMP_TASK")

while read -r line; do
    if ! existsCmd "$line"; then
        echo "$line is not found"

        if [ "$1" == "--no-pueue" ]; then
            cargo install "$line"
        else
            task_id=$(pueue add --after "$task_id" -p -- "cargo install $line")
        fi
    fi
done <"$HOME/.mimikun-pkglists/linux_cargo_packages.txt"
