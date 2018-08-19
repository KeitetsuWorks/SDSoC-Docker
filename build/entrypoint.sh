#!/bin/bash -e

##
## @file        entrypoint.sh
## @brief       Script to add user and group on the docker container
## @author      山本 直樹
## @date        2017/09/04
## @see         https://qiita.com/yama07/items/a521234dc91f923ba655
##

USER_ID=$(id -u)
GROUP_ID=$(id -g)

# グループを作成する
if [ x"$GROUP_ID" != x"0" ]; then
    groupadd -g $GROUP_ID $USER_NAME
fi

# ユーザを作成する
if [ x"$USER_ID" != x"0" ]; then
    useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME
fi

# パーミッションを元に戻す
sudo chmod u-s /usr/sbin/useradd
sudo chmod u-s /usr/sbin/groupadd

if [ x"$USER_ID" != x"0" ]; then
    export HOME=/home/$USER_NAME
fi

exec $@

