#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Frank Nicholas (with thanks)
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

echo
tput setaf 3
echo "################################################################"
echo "################### Start"
echo "################################################################"
tput sgr0
echo

# Problem solving commands

# Read before using it.
# https://www.atlassian.com/git/tutorials/undoing-changes/git-reset
# git reset --hard origin/master
# ONLY if you are very sure and no coworkers are on your github.

# Command that have helped in the past
# Force git to overwrite local files on pull - no merge
# git fetch all
# git push --set-upstream origin master
# git reset --hard origin/master


#setting up git
#https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config
#https://medium.com/clarusway/how-to-use-git-github-without-asking-for-authentication-always-passwordless-usage-of-private-git-8c32489bc2e9
#https://blog.nillsf.com/index.php/2021/05/27/github-sso-using-password-protected-ssh-keys

project=$(basename `pwd`)
#githubdir=$(basename $(dirname "$PWD" | tr '[:upper:]' '[:lower:]'))
echo "-----------------------------------------------------------------------------"
echo "this is project https://github.com/fsnicholas/"$project
echo "-----------------------------------------------------------------------------"

git config --global pull.rebase false
git config --global push.default simple
git config --global fetch.prune = true
git config --global user.name "fsnicholas"
git config --global user.email "frank.nicholas@gmail.com"
git config --system core.editor code --wait
git config --global credential.helper cache
#git config --global credential.helper 'cache --timeout=32000'

git remote set-url origin git@github.com:fsnicholas/$project

echo "Everything set"

echo
tput setaf 3
echo "################################################################"
echo "################### End"
echo "################################################################"
tput sgr0
echo
