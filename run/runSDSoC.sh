#!/bin/bash

##
## @file        runSDSoC.sh
## @brief       Script to run the Xilinx SDSoC docker image
## @author      Keitetsu
## @date        2018/08/19
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

docker run \
    --interactive \
    --tty \
    --net host \
    --rm \
    --volume /mnt:/data \
    --env DISPLAY=$DISPLAY \
    --volume $HOME/.Xauthority:/root/.Xauthority:rw \
    keitetsu/sdsoc-docker \
    /bin/bash

