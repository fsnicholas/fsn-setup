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
RED='\033[0;31m'
BRED='\033[1;31m'         # Bold Red
BYell='\033[1;33m'         # Bold Yellow
NC='\033[0m' # No Color
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo
tput setaf 2
echo "##################################################################"
echo "################### Setting up powermenu                        ##"
echo "##################################################################"
tput sgr0

# for powermenu
echo -e  "${BYell}Installing needed software for powermenu${NC}"
sudo pacman -S --noconfirm --needed arcolinux-powermenu-git

echo
echo -e  "${BYell}Installing personal settings for powermenu${NC}"
echo
[ -d $HOME"/.config/powermenu" ] || mkdir -p $HOME"/.config/powermenu"
cp -vrf $installed_dir/settings/config-fsn/powermenu/* ~/.config/powermenu/
echo
[ -d $HOME"/.bin" ] || mkdir -p $HOME"/.bin"
cp -vf  /etc/skel/.bin/powermenu-*  ~/.bin/ 
echo
echo
tput setaf 6
echo "################################################################"
echo "################### Done                                     ###"
echo "################################################################"
tput sgr0
echo