#!/bin/bash

# update TU server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit

# fix missing steamlib
cp /opt/tu/linux64/steamclient.so /opt/tu/Tower/Binaries/Linux/
#export LD_LIBRARY_PATH=/usr/lib32:${LD_LIBRARY_PATH}

# run TU server
exec /opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"
