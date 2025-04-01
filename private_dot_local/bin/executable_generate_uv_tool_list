#!/bin/bash

uv tool list |
    grep "v[0-9]" |
    sed -e "s/\s.*//g" |
    sort >"$HOME/.mimikun-pkglists/linux_uv_tools.txt"
