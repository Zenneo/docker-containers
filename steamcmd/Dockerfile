FROM ubuntu:14.04
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

RUN mkdir -p /opt/steamcmd

# Install steamcmd + srcds_linux dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y lib32gcc1 lib32stdc++6 ia32-libs gdb

# Install steamcmd to /opt/steamcmd/
ADD https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /tmp/
# Untar, create user steamcmd and chown
RUN tar -xvf /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd/ && \
    useradd -m steam && \
    chown -R steam /opt

# Switch to steam user
USER steam

ENTRYPOINT ["/opt/steamcmd/steamcmd.sh"]
