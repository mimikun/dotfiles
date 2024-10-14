#!/bin/bash

current_dir=$(pwd)

cd game_settings || exit
cp "${WIN_HOME}"/Saved\ Games/Respawn/Apex/local/previousgamestate.txt ./Apex_Legends
cp "${WIN_HOME}"/Saved\ Games/Respawn/Apex/local/settings.cfg ./Apex_Legends
cp "${WIN_HOME}"/Saved\ Games/Respawn/Apex/local/videoconfig.txt ./Apex_Legends
cp "${WIN_HOME}"/Saved\ Games/Respawn/Apex/profile/profile.cfg ./Apex_Legends
cd Apex_Legends || exit
fd -t f | xargs nkf -d --overwrite
cd "$current_dir" || exit
