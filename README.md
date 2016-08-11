# Game Server Docker-Container
This repository contains self-updating docker containers that host a variety of gameservers. It is a fork of the [benpye/docker-containers repository](https://github.com/benpye/docker-containers).

## steamcmd
This container prepares a Ubuntu 14.04 so that it can run SteamCMD. Steam games are supposed to be based on this container.

## gmod-vanilla
This container creates a Gmod server without any other games hooked up to it.

### Usage

    docker run -d --name gmodserver -v /mnt/docker/gmod:/opt/garrysmod/garrysmod -e GMOD_PORT=27015 zennoe/gmod-vanilla

## gmod-css-tf2
This container creates a Gmod server that includes asset from TF2 and CSS automatically.