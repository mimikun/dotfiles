#!/bin/bash

cargo_outdated_pkgs=$(cargo install-update -l | grep "Yes" | cut -d " " -f 1)
echo "Update these packages:"
echo "$cargo_outdated_pkgs"

if [ "$1" == "--no-pueue" ]; then
    for i in $cargo_outdated_pkgs; do
        cargo install "$i"
    done
else
    task_id=$(pueue add -p -- "echo start")

    for i in $cargo_outdated_pkgs; do
        task_id=$(pueue add --after "$task_id" -p -- "cargo install $i")
    done
fi
