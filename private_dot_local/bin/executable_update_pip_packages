#!/bin/bash

pip_outdated_pkgs=$(pip freeze | sed -e 's/=.*//g')
echo "Update these packages:"
echo "$pip_outdated_pkgs"

if [ "$1" == "--no-pueue" ]; then
    for i in $pip_outdated_pkgs; do
        pip install --upgrade "$i"
    done
else
    task_id=$(pueue add -p -- "echo start")

    for i in $pip_outdated_pkgs; do
        task_id=$(pueue add --after "$task_id" -p -- "pip install --upgrade $i")
    done
fi
