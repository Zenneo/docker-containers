#!/bin/bash

# update Gmod server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/garrysmod +app_update 4020 validate +quit
# update TF2 server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tf2 +app_update 232250 validate +quit
# update CSS server
/opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/css +app_update 232330 validate +quit

# Change Gmod config so that tf2 and css are mounted
echo "
	\"mountcfg\"
	{
		\"cstrike\"	\"/opt/css/cstrike\"
		\"tf\"	\"/opt/tf2/tf\"
	}
    " > /opt/garrysmod/garrysmod/cfg/mount.cfg

# run Gmod server
/opt/garrysmod/srcds_run -steamdir /opt/steamcmd -port "$GMOD_PORT" "$@"
