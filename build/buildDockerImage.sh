#!/bin/bash

##
## @file        buildDockerImage.sh
## @brief       Script to build the docker image
## @author      Keitetsu
## @date        2018/08/19
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

docker build \
    --tag keitetsu/sdsoc-docker \
    .
