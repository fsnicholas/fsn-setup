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
RED='\033[0;31m'
BRED='\033[1;31m'         # Bold Red
BYell='\033[1;33m'         # Bold Yellow
NC='\033[0m' # No Color
##################################################################################################################

#installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
installed_dir="/mnt/fn-docs/Linux-Distro/FSN-Linux"

##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Installing yt-dlp & ffmpeg files"
echo "################################################################"
tput sgr0
echo
echo -e  "${BYell} Copying files to ~/.local/bin ${NC}"
echo
[ -d $HOME"/.local/bin" ] || mkdir -p $HOME"/.local/bin"
cp -v -f $installed_dir/fsn-yt-dlp/* /home/nicholas/.local/bin/
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo

