#!/bin/bash

RESULT_FILE="STARTUPTIME.md"
TODAY=$(date "+%Y.%m.%d")

{
    echo "## $TODAY"

    echo ""
    echo "### Neovim"
    echo ""
    echo '```shell'
    echo '❯ vim-startuptime -vimpath nvim | head -n 6' >>$RESULT_FILE
    vim-startuptime -vimpath nvim | head -n 6
    echo '```'
} >>$RESULT_FILE
