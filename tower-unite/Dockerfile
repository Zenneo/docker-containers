FROM zennoe/steamcmd:testing
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# set ports
ENV QUERY_PORT=27015
ENV TU_PORT=7777

# add docker-entrypoint.sh and fix permissions
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN ln -s /usr/local/bin/docker-entrypoint.sh / && \
    chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /opt/tu
COPY steamclient.so /opt/tu/Tower/Binaries/Linux
    
USER steam


VOLUME /opt/tu
EXPOSE ${QUERY_PORT}/udp ${QUERY_PORT}/tcp ${TU_PORT}/udp 7778/udp 3478/udp 4379/udp 4380/udp

# entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
