# Game Server Docker-Container
[This repository](https://github.com/Zennoe/docker-gameservers) contains self-updating docker containers that host a variety of gameservers. It is a fork of the [benpye/docker-containers repository](https://github.com/benpye/docker-containers).

Available containers:
- steamcmd
- gmod-vanilla
- gmod-css-tf2
- tf2
- tower-unite

## steamcmd
This container prepares an Ubuntu 14.04 installation so that it can run SteamCMD. Game server that are updated through Steam are supposed to be based on this container. Please keep in mind that SteamCMD runs as a user called _steam_.

## gmod-vanilla
This container creates a Gmod server without any other games hooked up to it.

### Usage

    mkdir -p /mnt/docker/garrysmod
    chmod 777 /mnt/docker/garrysmod
    docker pull zennoe/gmod-vanilla
    docker run -d --name gmodserver -v /mnt/docker/garrysmod:/opt/garrysmod -p 27015:27015/udp -p 27015:27015/tcp -e GMOD_PORT=27015 zennoe/gmod-vanilla -game garrysmod +gamemode sandbox +map gm_flatgrass
    
You can change the gamemode and map or add your own parameters.

If you cannot connect to your server because it is outdated stop and restart your installation using `docker stop gmodserver ` and `docker start gmodserver`. Then re-run your setup commands (see above).

## gmod-css-tf2
This container creates a Gmod server that includes asset from TF2 and CSS. The mount.cfg file is automatically updated so that the extra assets are mounted. For further information about usage etc. look at the description of _gmod-vanilla_.

### Usage

    mkdir -p /mnt/docker/garrysmod
    mkdir /mnt/docker/tf2
    mkdir /mnt/docker/css
    chmod 777 /mnt/docker/garrysmod
    chmod 777 /mnt/docker/tf2
    chmod 777 /mnt/docker/css
    docker pull zennoe/gmod-css-tf2
    docker run -d --name gmodserver -v /mnt/docker/garrysmod:/opt/garrysmod -v /mnt/docker/css:/opt/css -v /mnt/docker/tf2:/opt/tf2 -p 27015:27015/udp -p 27015:27015/tcp -e GMOD_PORT=27015 zennoe/gmod-css-tf2 -game garrysmod +gamemode sandbox +map gm_flatgrass

## tf2
This container creates a TF2 server that is updated through SteamCMD.

### Usage

    mkdir -p /mnt/docker/tf2
    chmod 777 /mnt/docker/tf2
    docker pull zennoe/tf2
    docker run -d --name tf2server -v /mnt/docker/tf2:/opt/tf2 -p 27015:27015/udp -p 27015:27015/tcp -e TF2_PORT=27015 zennoe/tf2 -game tf +sv_pure 1 +map ctf_2fort +maxplayers 24
    
## tower-unite
This container creates a Tower Unite Dedicated server that is updated through SteamCMD.

### Usage

    mkdir -p /mnt/docker/tu
    chmod 777 /mnt/docker/tu
    docker pull zennoe/tower-unite
    docker run -d --name tuserver -v /mnt/docker/tu:/opt/tu -p 27015:27015/udp -p 27015:27015/tcp -p 7777:7777/udp -p 7778:7778/udp -p 3478/udp -p 4379/udp -p 4380/udp -e TU_PORT=7777 -e QUERY_PORT=27015 zennoe/tower-unite
