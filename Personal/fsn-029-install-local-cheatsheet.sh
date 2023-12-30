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
echo "################### Installing cheatsheet from github"
echo "################################################################"
tput sgr0
echo
echo -e  "${BYell} Creating directory $HOME"/.config/cheat/cheatsheets"${NC}"
echo
[ -d $HOME"/.config/cheat/cheatsheets" ] || mkdir -p $HOME"/.config/cheat/cheatsheets"
echo
echo -e  "${BYell} Cloning cheatsheets from github${NC}"
echo
git clone https://github.com/cheat/cheatsheets $HOME"/.config/cheat/cheatsheets/community"
echo
echo -e  "${BYell}Copying config & executable to local directories${NC}"
echo
cp -vf $installed_dir/settings/cheat/* $HOME"/.config/cheat/"
echo
cp -vf $installed_dir/settings/local-bin/cheat $HOME"/.local/bin/"
echo
chmod +x $HOME"/.local/bin/cheat"
echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
##### application at https://github.com/cheat/cheat/releases

