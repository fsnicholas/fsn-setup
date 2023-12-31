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
echo "################### Installing ranger & needed software     ####"
echo "################################################################"
tput sgr0
echo
sudo pacman -Syy
echo
sudo pacman -S --noconfirm --needed ranger
sudo pacman -S --noconfirm --needed highlight
sudo pacman -S --noconfirm --needed atool
sudo pacman -S --noconfirm --needed ueberzug
echo
echo -e  "${BYell} Creating directory $HOME"/.config/ranger"${NC}"
echo
[ -d $HOME"/.config/ranger" ] || mkdir -p $HOME"/.config/ranger"
echo
echo -e  "${BYell}Copying ranger config to local directory${NC}"
echo
cp -vrf $installed_dir/settings/ranger/* $HOME"/.config/ranger/"
echo
tput setaf 6
echo "################################################################"
echo "###################        Done      ###########################"
echo "################################################################"
tput sgr0
echo
