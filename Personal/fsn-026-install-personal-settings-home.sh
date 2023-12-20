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
echo "################################################################"
echo "################### Personal settings to install - home"
echo "################################################################"
tput sgr0
echo
echo -e  "${BYell} Copying files to home directory (~) ${NC}"
echo
#cp -vf $installed_dir/settings/home/.ptconfig.toml ~/.ptconfig.toml
#cp -vf $installed_dir/settings/home/.gitconfig ~/.gitconfig
#cp -vf $installed_dir/settings/home/.xinitrc ~/.xinitrc
#cp -vf $installed_dir/settings/home/.Xresources ~/.Xresources

cp -vf $installed_dir/settings/home/.*   /home/nicholas/

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
