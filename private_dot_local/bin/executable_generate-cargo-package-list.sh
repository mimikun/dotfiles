#!/bin/bash

cargo install-update --list | tail -n +4 | sed -e "s/ /\t/g" | cut -f 1 > "$HOME"/cargo_packages.txt
