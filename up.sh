#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Frank Nicholas (using with thanks)
##################################################################################################################
#
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

# reset - commit your changes or stash them before you merge
# git reset --hard - ArcoLinux alias - grh

# reset - go back one commit - all is lost
# git reset --hard HEAD~1

# remove a file online but keep it locally
# https://www.baeldung.com/ops/git-remove-file-without-deleting-it
# git rm --cached file.txt

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

#workdir=$(pwd)

# Below command will backup everything inside the project folder
git add --all .

echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text
git commit -m "$input"

# Push the local files to github
git push -u origin main


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
