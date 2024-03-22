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

#installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
installed_dir="/mnt/fn-docs/Linux-Distro/FSN-Linux"

##################################################################################################################

echo
tput setaf 2
echo "################################################################"
echo "################### Personal settings for ssh"
echo "################################################################"
tput sgr0
echo

echo
echo "Installing ssh settings files"
[ -d $HOME"/.ssh" ] || mkdir -p $HOME"/.ssh"
cp -vRf $installed_dir/fsn-ssh/.ssh/ ~/
cp -vf $installed_dir/fsn-ssh/.my-credentials ~/.my-credentials
cp -vf $installed_dir/fsn-ssh/.zprofile ~/.zprofile

echo
# setup ssh directories
echo 
echo -e  "${BYell} Setting up ssh directories permission ${NC}"
sudo chmod 700 ~/.ssh
sudo chmod 700 ~/.ssh/config
sudo chmod 600 ~/.ssh/id_ed25519
sudo chmod 644 ~/.ssh/id_ed25519.pub
sudo chmod 600 ~/.ssh/id_ed25519_gitlab
sudo chmod 644 ~/.ssh/id_ed25519_gitlab.pub
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
