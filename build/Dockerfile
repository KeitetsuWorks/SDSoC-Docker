##
## @file        Dockerfile
## @brief       Dockerfile to Build the docker image
##              for Xilinx SDSoC installation
## @author      Keitetsu
## @date        2018/08/19
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM ubuntu:16.04

LABEL maintainer="KeitetsuWorks@users.noreply.github.com"

# install applications
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y locales && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    apt-get install -y g++-multilib && \
    apt-get install -y libgtk2.0-0:i386 dpkg-dev:i386 && \
    apt-get install -y libxtst6 && \
    apt-get install -y libcanberra-gtk-module && \
    apt-get install -y lsb-release && \
    apt-get install -y unzip && \
    apt-get install -y fonts-noto-cjk && \
    apt-get clean && \
    apt-get autoclean && \
    ln -s /usr/bin/make /usr/bin/gmake && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# vim settings (optional)
RUN cd ~ && \
    git clone https://github.com/tomasr/molokai.git && \
    mkdir -p ~/.vim/colors && \
    mv ./molokai/colors/molokai.vim ~/.vim/colors && \
    rm -rf ./molokai && \
    git clone https://github.com/KeitetsuWorks/VimSettings.git && \
    mv ./VimSettings/.vimrc ~ && \
    rm -rf ./VimSettings && \
    sed -i -e "/^colorscheme.*/i set t_Co=256" .vimrc && \
    cp -r ~/.vim /etc/skel && \
    cp ~/.vimrc /etc/skel

# locale settings
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

