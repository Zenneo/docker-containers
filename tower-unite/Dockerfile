FROM zennoe/steamcmd:latest
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# add docker-entrypoint.sh and fix permissions
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN ln -s /usr/local/bin/docker-entrypoint.sh / && \
    chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /opt/tu
USER steam


VOLUME /opt/tu
EXPOSE 27015/udp 27015/tcp 7777/udp 7778/udp 3478/udp 4379/udp 4380/udp

# entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
