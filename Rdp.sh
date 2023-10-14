#!/bin/bash
clear
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
echo "
#######################################################################################
#
#                                  LEGENDYT4K PKG
#
#                           Copyright (C) 2022 - 2023, VPSFREE.ES
#
#
#######################################################################################"
echo "Select an option:"
echo "1) LXDE - XRDP"
echo "2) PufferPanel"
echo "3) Install Basic Packages"
echo "4) Install Nodejs"
read option
 
if [ $option -eq 1 ]; then
    clear
    echo -e "${RED}Downloading... Please Wait"
    apt update && apt upgrade -y
    export SUDO_FORCE_REMOVE=yes
    apt remove sudo -y
    apt install lxde -y
    apt install xrdp -y
    echo "lxsession -s LXDE -e LXDE" >> /etc/xrdp/startwm.sh
clear
    echo -e "${GREEN}Downloading and installation completed!"
    echo -e "${YELLOW}Select RDP Port"
    read selectedPort
 
    sed -i "s/port=3389/port=$selectedPort/g" /etc/xrdp/xrdp.ini
clear
    service xrdp restart
    clear
    echo -e "${GREEN}RDP Created And Started on Port $selectedPort"
