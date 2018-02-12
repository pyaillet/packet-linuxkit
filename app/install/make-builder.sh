#!/bin/sh

apt-get install docker.io git

git clone https://github.com/linuxkit/linuxkit.git

cd linuxkit
make