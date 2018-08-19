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
    apt-get install -y sudo && \
    apt-get install -y vim && \
    apt-get install -y git && \
    apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    apt-get install -y g++-multilib && \
    apt-get install -y libgtk2.0-0:i386 dpkg-dev:i386 && \
    apt-get install -y libcanberra-gtk-module && \
    apt-get install -y libxtst6 && \
    apt-get install -y lsb-release && \
    apt-get clean && \
    apt-get autoclean && \
    ln -s /usr/bin/make /usr/bin/gmake && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

# 一般ユーザ名を設定
ENV USER_NAME=developer

# sudoを使用できるようにする
RUN echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME}

# 一般ユーザがユーザ/グループを追加できるようにする
# entrypoint.sh内でパーミッションを元に戻す
RUN chmod u+s /usr/sbin/useradd && \
    chmod u+s /usr/sbin/groupadd

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

# ENTRYPOINT settings
COPY entrypoint.sh /usr/sbin/entrypoint.sh
ENTRYPOINT ["/usr/sbin/entrypoint.sh"]

