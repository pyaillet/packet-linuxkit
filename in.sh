#!/bin/sh

docker build . -t packet-linuxkit/tools

if [[ $? -eq 0 ]]; then
    docker rm -f packet-linuxkit-tools 
    
    docker run -it \
        -v $PWD/app:/root/app \
        --name packet-linuxkit-tools packet-linuxkit/tools
fi
