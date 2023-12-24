#!/bin/bash
#set -e
##################################################################################################################
# Author    : Frank Nicholas
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo
tput setaf 2
echo "##################################################################"
echo "################### Installing Mount Points"
echo "##################################################################"
tput sgr0

sudo mkdir /mnt/fn-docs
sudo chown -R nicholas:nicholas  /mnt/fn-docs
sudo chmod -R u=rwx,g=rw,o=r /mnt/fn-docs

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

