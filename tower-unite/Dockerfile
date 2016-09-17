FROM zennoe/steamcmd:testing
MAINTAINER Thomas Schmitz <agrar.pfurtz@gmail.com>

# switch to steam user
USER steam

# set ports
ENV QUERY_PORT=27015
ENV TU_PORT=7777

# general env variables
ENV LD_LIBRARY_PATH=/usr/lib32:$LD_LIBRARY_PATH

# add docker-entrypoint.sh and fix permissions
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN ln -s /usr/local/bin/docker-entrypoint.sh / && \
    chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    mkdir /opt/tu

# install additional dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mono-gmcs mono-xbuild mono-dmcs libmono-corlib4.0-cil libmono-system-data-datasetextensions4.0-cil \
    libmono-system-web-extensions4.0-cil libmono-system-management4.0-cil libmono-system-xml-linq4.0-cil \
    dos2unix clang xdg-user-dirs
    
USER steam


VOLUME /opt/tu
EXPOSE ${QUERY_PORT}/udp ${QUERY_PORT}/tcp ${TU_PORT}/udp 7778/udp 3478/udp 4379/udp 4380/udp

# entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
