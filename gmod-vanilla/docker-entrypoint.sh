#!/bin/bash

# update Gmod server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/garrysmod +app_update 4020 validate +quit

# run Gmod server
exec /opt/garrysmod/srcds_run -steamdir /opt/steamcmd -port "$GMOD_PORT" "$@"
