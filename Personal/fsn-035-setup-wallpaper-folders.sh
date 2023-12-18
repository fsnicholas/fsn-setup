#!/bin/bash
#set -e
##################################################################################################################
# Author    : Frank Nicholas (Eric Dubois)
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
echo "################### Personal wallpaper links  in ~/local/share    "
echo "##################################################################"
tput sgr0

sudo rm -rf ~/.local/share/wallpapers
sudo ln -s /mnt/fn-docs/Linux-Distro/share-wallpaper /home/nicholas/.local/share/wallpapers

sudo rm -rf ~/.local/share/backgrounds
sudo ln -s /mnt/fn-docs/Linux-Distro/share-wallpaper/dark-wallpaper /home/nicholas/.local/share/backgrounds
