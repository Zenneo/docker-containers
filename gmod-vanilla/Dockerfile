FROM zennoe/steamcmd:latest
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# Gmod port
ENV GMOD_PORT=27015

# Install Garry's Mod to /opt/garrysmod/
RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /opt/garrysmod \
    +app_update 4020 validate +quit

VOLUME /opt/garrysmod/garrysmod

EXPOSE ${GMOD_PORT}/udp ${GMOD_PORT}/tcp

ENV LD_LIBRARY_PATH=/opt/garrysmod/bin
ENTRYPOINT ["/opt/garrysmod/srcds_linux -steamdir /opt/steamcmd -port ${GMOD_PORT}"]
