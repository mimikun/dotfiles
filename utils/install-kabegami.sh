#!/bin/bash

current_dir=$(pwd)
KABEGAMI_DIR="$HOME/.kabegami"
if [ ! -d "$KABEGAMI_DIR" ]; then
    mkdir -p "$KABEGAMI_DIR"
fi

#-----------------#
# Define function #
#-----------------#

function genshin_nahida() {
    cd /tmp || exit
    cd "$current_dir" || exit
}

function buruaka_azusa_1() {
    cd /tmp || exit
    cd "$current_dir" || exit
}

#------#
# main #
#------#

genshin_nahida
buruaka_azusa_1
