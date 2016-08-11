FROM zennoe/gmod-vanilla
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# Gmod port
ENV GMOD_PORT=27015

# Install TF2 to /opt/tf2/
RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/tf2 \
    +app_update 232250 validate +quit
# Install CSS to /opt/css/
RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/css \
    +app_update 232330 validate +quit
	
# Change Gmod config so that games are mounted
RUN echo "
	\"mountcfg\"
	{
		\"cstrike\"	\"/opt/css/cstrike\"
		\"tf\"	\"/opt/tf2/tf\"
	}
    " > /opt/garrysmod/garrysmod/cfg/mount.cfg

VOLUME /opt/garrysmod/garrysmod
VOLUME /opt/tf2
VOLUME /opt/css

EXPOSE ${GMOD_PORT}/udp ${GMOD_PORT}/tcp

ENV LD_LIBRARY_PATH=/opt/garrysmod/bin
ENTRYPOINT ["/opt/garrysmod/srcds_linux -steamdir /opt/steamcmd -port ${GMOD_PORT}"]
