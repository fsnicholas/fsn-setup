#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
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
echo "################### Remove drivers I do not need for real metal"
echo "################################################################"
tput sgr0
echo

tput setaf 3;echo "  DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK."
echo "  THIS MAY BRICK YOUR SYSTEM";tput sgr0

sudo pacman -R --noconfirm xf86-video-amdgpu
sudo pacman -R --noconfirm xf86-video-ati
sudo pacman -R --noconfirm xf86-video-fbdev
sudo pacman -R --noconfirm xf86-video-intel
sudo pacman -R --noconfirm xf86-video-nouveau
sudo pacman -R --noconfirm xf86-video-openchrome
sudo pacman -R --noconfirm xf86-video-vesa

echo
tput setaf 2
echo "################################################################"
echo "################### fix for variety problems "
echo "################################################################"
tput sgr0
echo
# 
echo
echo "Removing  variety config"
sudo pacman -R --noconfirm  arcolinux-variety-git
rm -Rf ~/.config/variety/*


echo
tput setaf 2
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
