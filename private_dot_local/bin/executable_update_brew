#!/bin/bash

which brew >/dev/null
if test $? -eq 0; then
    echo "Running brew update..."
    brew update
    echo "Running brew upgrade..."
    brew upgrade
    if test "$(os_info -t)" == "OS type: Mac OS"; then
        echo "Running brew cask upgrade..."
        brew upgrade --cask
    fi
    echo "Running brew cleanup..."
    brew cleanup
else
    echo "brew not installed!"
fi
