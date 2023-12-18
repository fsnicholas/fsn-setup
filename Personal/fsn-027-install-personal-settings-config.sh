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
echo "################### Personal settings to install - .config  files"
echo "##################################################################"
tput sgr0
echo
echo -e  "${BYell} Copying setting files  to ~/.config ${NC}"
echo
#echo "Copying files - dunst"
#[ -d $HOME"/.config/dunst" ] || mkdir -p $HOME"/.config/dunst"
#echo
#cp -Rf $installed_dir/settings/dunst/* /home/nicholas/.config/dunst/

echo
cp -vrf $installed_dir/settings/config-fsn/* ~/.config

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

