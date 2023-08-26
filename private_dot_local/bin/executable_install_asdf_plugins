#!/bin/bash

while read -r line; do
    # shellcheck disable=SC2086
    asdf plugin add $line
    sleep 1
done <~/asdf_plugin_list.txt
