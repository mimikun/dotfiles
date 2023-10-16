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

    echo ""
    echo "### Fish-shell"
    echo ""
    echo '```shell'
    echo '❯ hyperfine -w 5 -r 50 "fish -i -c exit"'
    hyperfine -w 5 -r 50 "fish -i -c exit"
    echo '```'

    echo ""
    echo "### PowerShell Core(Linux) (pwsh)"
    echo ""
    echo '```powershell'
    echo '❯ hyperfine -w 5 -r 50 pwsh -i -c exit"'
    hyperfine -w 5 -r 50 "pwsh -i -c exit"
    echo '```'

    echo ""
    echo "### Paleovim(vim)"
    echo ""
    echo '```shell'
    echo '❯ vim-startuptime -vimpathvim | head -n 6' >>$RESULT_FILE
    vim-startuptime -vimpath vim | head -n 6
    echo '```'
    echo ""
} >>$RESULT_FILE
