#!/bin/bash

# update TU server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit

# run TU server
/opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$TU_PORT" "$@"
