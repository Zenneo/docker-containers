#!/bin/bash

# update TU server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit

# fix missing steamlib
mkdir /opt/Steam/sdk32/
ln -s /opt/steamcmd/linux32/steamclient.so /opt/Steam/sdk32/steamclient.so
cp /opt/steamcmd/linux32/* /opt/tu/Tower/Binaries/Linux/
cp /opt/steamcmd/linux64/* /opt/tu/Tower/Binaries/Linux/
export LD_LIBRARY_PATH=/usr/lib32:${LD_LIBRARY_PATH}

# run TU server
/opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"