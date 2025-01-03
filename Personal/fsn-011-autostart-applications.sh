#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Frank Nicholas with thanks
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
echo "################### Autostart certain applications"
echo "################################################################"
tput sgr0
echo

[ -d $HOME"/.config/autostart" ] || mkdir -p $HOME"/.config/autostart"

sleep 1

cp -f $installed_dir/settings/config-fsn/autostart/* $HOME"/.config/autostart"

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
