# Game Server Docker-Container
This repository contains self-updating docker containers that host a variety of gameservers. It is a fork of the [benpye/docker-containers repository](https://github.com/benpye/docker-containers).

Available containers:
- steamcmd
- gmod-vanilla
- gmod-css-tf2

## steamcmd
This container prepares an Ubuntu 14.04 installation so that it can run SteamCMD. Game server that are updated through Steam are supposed to be based on this container. Please keep in mind that SteamCMD runs as a user called _steam_.

## gmod-vanilla
**Current version: _July 2016_**

This container creates a Gmod server without any other games hooked up to it.

### Usage

    mkdir /mnt/docker/garrysmod
    chmod 777 /mnt/docker/garrysmod
    docker pull zennoe/gmod-vanilla
    docker run -d --name gmodserver -v /mnt/docker/garrysmod:/opt/garrysmod -p 27015:27015/udp -p 27015:27015/tcp -e GMOD_PORT=27015 zennoe/gmod-vanilla -game garrysmod +gamemode sandbox +map gm_flatgrass
    
You can change the gamemode and map or add your own parameters.

If you cannot connect to your server because it is outdated stop and delete your installation using `docker stop gmodserver ` and `docker rm gmodserver`. Then re-run your setup commands (see above).

## gmod-css-tf2
This container creates a Gmod server that includes asset from TF2 and CSS. The mount.cfg file is automatically updated so that the extra assets are mounted.
