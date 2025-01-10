#!/bin/bash

pip freeze |
    sed \
        -e "s/=.*//g" \
        -e "s/ @.*//g" |
    sort > \
        "$HOME/.mimikun-pkglists/linux_pip_packages.txt"
