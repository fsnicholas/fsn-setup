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
echo "################### Personal settings to install - zsh"
echo "################################################################"
tput sgr0
echo
echo -e  "${BYell} Copying doas.conf to /etc ${NC}"
echo
# delete if file exists
sudo rm -f -- /etc/doas.conf
sudo cp $installed_dir/settings/doas/doas.conf   /etc/doas.conf

echo "Installing antigen"
echo
rm -rf ~/.antigen
git clone https://github.com/zsh-users/antigen.git ~/.antigen
echo
echo "Installing fzf"
echo
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo
echo "Installing zsh"
[ -d $HOME"/.config/zsh" ] || mkdir -p $HOME"/.config/zsh"
cp -f   $installed_dir/settings/zsh/antigenrc ~/.config/antigenrc
cp -f   $installed_dir/settings/zsh/zsh-home/.zshenv ~/.zshenv
cp -vrf $installed_dir/settings/zsh/zsh-config/. ~/.config/zsh


echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
