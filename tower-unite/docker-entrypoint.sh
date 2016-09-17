#!/bin/bash

# update TU server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tu +app_update 439660 validate +quit

# fix missing steamlib
cp /opt/steamcmd/linux32/* /opt/tu/Tower/Binaries/Linux/
export LD_LIBRARY_PATH=/usr/lib32:${LD_LIBRARY_PATH}

apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mono-gmcs mono-xbuild mono-dmcs libmono-corlib4.0-cil libmono-system-data-datasetextensions4.0-cil \
    libmono-system-web-extensions4.0-cil libmono-system-management4.0-cil libmono-system-xml-linq4.0-cil \
    dos2unix clang xdg-user-dirs

# run TU server
/opt/tu/Tower/Binaries/Linux/TowerServer-Linux-Shipping -log  -Port="$TU_PORT" -QueryPort="$QUERY_PORT" "$@"