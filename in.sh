#!/bin/sh

docker build . -t tools

if [[ $? -eq 0 ]]; then
    docker rm -f tools 
    
    docker run -it \
        -v $PWD/app:/root/app \
        --name tools tools
fi