FROM ubuntu:14.04
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

RUN mkdir -p /opt/steamcmd

# Install steamcmd + srcds_linux dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y lib32gcc1 lib32stdc++6

# Install steamcmd to /opt/steamcmd/
ADD https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /tmp/
RUN tar -xvf /tmp/steamcmd_linux.tar.gz -C /opt/steamcmd/

ENTRYPOINT ["/opt/steamcmd/steamcmd.sh"]
