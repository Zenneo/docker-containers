#!/bin/bash

# update TF2 server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tf2 +app_update 232250 validate +quit

# run Gmod server
/opt/tf2/srcds_run -steamdir /opt/steamcmd -port "$TF2_PORT" "$@"
