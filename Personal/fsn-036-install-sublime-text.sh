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
#Colour Variables
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
echo "################### Installing sublime-text"
echo "################################################################"
tput sgr0
echo
echo -e  "${BYell} Initial Copy: sublime_text to ~/Downloads ${NC}"
echo
cp -vf $installed_dir/fsn-sublime-text/sublime_text /home/nicholas/Downloads/
echo
echo -e  "${BRED}Setting up system permissions on sublime text ${NC}"
cd $HOME/Downloads/
sudo chmod 755 sublime_text
sudo chown root sublime_text
sudo chgrp root sublime_text
echo
echo -e  "${BRED}Renaming sublime_text to sublime_text.old ${NC}"
echo
sudo rm -f /opt/sublime_text/sublime_text.old
sudo mv /opt/sublime_text/sublime_text  /opt/sublime_text/sublime_text.old
echo
echo -e  "${BRED}Moving new sublime_text to /opt directory${NC}"
echo
sudo mv sublime_text /opt/sublime_text/
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
