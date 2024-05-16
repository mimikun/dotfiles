#!/bin/bash

pip freeze |
    sed \
        -e "s/=.*//g" \
        -e "s/ @.*//g" \
        >"$HOME/.mimikun-pkglists/linux_pip_packages.txt"
