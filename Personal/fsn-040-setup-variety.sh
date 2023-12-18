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

# for variety
sudo pacman -S --noconfirm --needed python-setuptools
sudo pacman -S --noconfirm --needed python-cairo

echo
echo "Installing personal settings of variety"
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
cp -vf $installed_dir/settings/variety/variety.conf ~/.config/variety/
echo