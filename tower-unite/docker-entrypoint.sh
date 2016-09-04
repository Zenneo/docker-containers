#!/bin/bash

# update TU server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit

# fix missing steamlib
cp /opt/steamcmd/linux32/* /opt/tu/Tower/Binaries/Linux/
LD_LIBRARY_PATH=/usr/lib64:${LD_LIBRARY_PATH}

# run TU server
/opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"
