FROM zennoe/steamcmd:latest
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# Gmod port
ENV TF2_PORT=27015

ENV LD_LIBRARY_PATH=/opt/tf2/bin

# add docker-entrypoint.sh and fix permissions
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /opt/tf2
USER steam


VOLUME /opt/tf2
EXPOSE ${TF2_PORT}/udp ${TF2_PORT}/tcp

# entrypoint
ENTRYPOINT ["/bin/sh", "-c", "docker-entrypoint.sh"]
CMD ["-game", "tf", "+sv_pure", "1", "+map", "ctf_2fort", "+maxplayers", "24"]
