FROM zennoe/steamcmd:testing
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# Gmod port
ENV GMOD_PORT=27015


ENV LD_LIBRARY_PATH=/opt/garrysmod/bin

# add docker-entrypoint.sh and fix permissions
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN ln -s /usr/local/bin/docker-entrypoint.sh / && \
    chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    chmod -R 777 /opt/garrysmod
USER steam


VOLUME /opt/garrysmod
EXPOSE ${GMOD_PORT}/udp ${GMOD_PORT}/tcp

# entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["-game", "garrysmod", "+gamemode", "sandbox", "+map", "gm_bigcity_hdr"]
