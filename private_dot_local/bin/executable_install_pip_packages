#!/bin/bash

task_id=$(pueue add -p -- "echo TEMP_TASK")

while read -r line; do
    case "$line" in
    "thefuck")
        echo "Install specify version thefuck"

        if [ "$1" == "--no-pueue" ]; then
            pip install 'thefuck @ git+https://github.com/nvbn/thefuck@62e0767c5069aeee176b0fe3459068b7703aaa26'
        else
            task_id=$(pueue add --after "$task_id" -p -- "pip install 'thefuck @ git+https://github.com/nvbn/thefuck@62e0767c5069aeee176b0fe3459068b7703aaa26'")
        fi
        ;;
    *)
        echo "Install: $line"

        if [ "$1" == "--no-pueue" ]; then
            pip install "$line"
        else
            task_id=$(pueue add --after "$task_id" -p -- "pip install $line")
        fi
        ;;
    esac
done <"$HOME/.mimikun-pkglists/linux_pip_packages.txt"
