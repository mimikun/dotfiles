#!/bin/bash

while read -r line; do
    case "$line" in
    "pynvim")
        echo "Install specify version pynvim"
        pueue add -- "pip install 'pynvim @ git+https://github.com/neovim/pynvim@c4197f13fe405b039a6acbe63076f3edade30fbb'"
        ;;
    "thefuck")
        echo "Install specify version thefuck"
        pueue add -- "pip install 'thefuck @ git+https://github.com/nvbn/thefuck@62e0767c5069aeee176b0fe3459068b7703aaa26'"
        ;;
    *)
        echo "Install: $line"
        pueue add -- "pip install $line"
        ;;
    esac
done <"$HOME/.mimikun-pkglists/linux_pip_packages.txt"
