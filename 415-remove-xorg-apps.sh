#!/bin/bash
#set -e
##################################################################################################################
# Frank Nicholas with thanks
############################################################################################################
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
echo "################### Remove xfce4 apps I don't need"
echo "################################################################"
tput sgr0
echo

sudo pacman -R --noconfirm xorg-bdftopcf
sudo pacman -R --noconfirm xorg-mkfontscale
sudo pacman -R --noconfirm xorg-smproxy
sudo pacman -R --noconfirm xorg-x11perf
sudo pacman -R --noconfirm xorg-xbacklight
sudo pacman -R --noconfirm xorg-xcmsdb
sudo pacman -R --noconfirm xorg-xcursorgen
sudo pacman -R --noconfirm xorg-xdriinfo
sudo pacman -R --noconfirm xorg-xev
sudo pacman -R --noconfirm xorg-xgamma
sudo pacman -R --noconfirm xorg-xkbevd
sudo pacman -R --noconfirm xorg-xkbprint
sudo pacman -R --noconfirm xorg-xkbutils
sudo pacman -R --noconfirm xorg-xlsatoms
sudo pacman -R --noconfirm xorg-xlsclients
sudo pacman -R --noconfirm xorg-xpr
sudo pacman -R --noconfirm xorg-xrefresh


echo
tput setaf 2
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo