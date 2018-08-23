#!/bin/bash -e

##
## @file        installSDSoC.sh
## @brief       Script to install the Xilinx SDSoC
## @author      Keitetsu
## @date        2018/08/19
## @copyright   Copyright (c) 2018 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

#tar xvzf Xilinx_SDx_2017.4_1216_1.tar.gz
#cd ./Xilinx_SDx_2017.4_1216_1

#./xsetup -b ConfigGen
./xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config ./install_config.txt

cd ..
#rm -rf ./Xilinx_SDx_2017.4_1216_1

echo 'if [ -f /opt/Xilinx/SDx/2017.4/settings64.sh ]; then' >> /root/.bashrc
echo '    . /opt/Xilinx/SDx/2017.4/settings64.sh' >> /root/.bashrc
echo 'fi' >> /root/.bashrc
echo 'if [ -f /opt/Xilinx/SDx/2017.4/settings64.sh ]; then' >> /etc/skel/.bashrc
echo '    . /opt/Xilinx/SDx/2017.4/settings64.sh' >> /etc/skel/.bashrc
echo 'fi' >> /etc/skel/.bashrc

