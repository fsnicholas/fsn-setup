#!/bin/bash

# setting up new version of doas.conf

#Colour Variables
RED='\033[0;31m'
BRED='\033[1;31m'         # Bold Red
BYell='\033[1;33m'         # Bold Yellow
NC='\033[0m' # No Color

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo -e  "${BYell} Copying doas.conf to /etc ${NC}"
echo
# delete if file exists
sudo rm -f -- /etc/doas.conf
sudo cp $installed_dir/settings/doas/doas.conf   /etc/doas.conf
