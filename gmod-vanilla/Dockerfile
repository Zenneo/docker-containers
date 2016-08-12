FROM zennoe/steamcmd:testing
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# Gmod port
ENV GMOD_PORT=27015

VOLUME /opt/garrysmod

EXPOSE ${GMOD_PORT}/udp ${GMOD_PORT}/tcp

ENV LD_LIBRARY_PATH=/opt/garrysmod/bin
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["-game", "garrysmod", "+gamemode", "sandbox", "+map", "gm_bigcity_hdr"]
