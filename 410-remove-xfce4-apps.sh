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
echo "################### Remove xfce4 apps I don't need"
echo "################################################################"
tput sgr0
echo

tput setaf 3;echo "  DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK."
echo "  THIS MAY BRICK YOUR SYSTEM";tput sgr0

sudo pacman -R --noconfirm xfce4-artwork
sudo pacman -R --noconfirm xfce4-battery-plugin 
sudo pacman -R --noconfirm xfce4-clipman-plugin 
sudo pacman -R --noconfirm xfce4-cpufreq-plugin 
sudo pacman -R --noconfirm xfce4-cpugraph-plugin
sudo pacman -R --noconfirm xfce4-dict
sudo pacman -R --noconfirm xfce4-diskperf-plugin
sudo pacman -R --noconfirm xfce4-eyes-plugin
sudo pacman -R --noconfirm xfce4-fsguard-plugin 
sudo pacman -R --noconfirm xfce4-genmon-plugin 
sudo pacman -R --noconfirm xfce4-mailwatch-plugin
sudo pacman -R --noconfirm xfce4-mpc-plugin 
sudo pacman -R --noconfirm xfce4-netload-plugin 
sudo pacman -R --noconfirm xfce4-notes-plugin
sudo pacman -R --noconfirm xfce4-notifyd
sudo pacman -R --noconfirm xfce4-panel-profiles 
sudo pacman -R --noconfirm xfce4-power-manager 
sudo pacman -R --noconfirm xfce4-pulseaudio-plugin
sudo pacman -R --noconfirm xfce4-screensaver 
sudo pacman -R --noconfirm xfce4-screenshooter
sudo pacman -R --noconfirm xfce4-sensors-plugin
sudo pacman -R --noconfirm xfce4-smartbookmark-plugin
sudo pacman -R --noconfirm xfce4-systemload-plugin
sudo pacman -R --noconfirm xfce4-time-out-plugin
sudo pacman -R --noconfirm xfce4-timer-plugin
sudo pacman -R --noconfirm xfce4-verve-plugin
sudo pacman -R --noconfirm xfce4-wavelan-plugin
sudo pacman -R --noconfirm xfce4-weather-plugin
sudo pacman -R --noconfirm xfce4-whiskermenu-plugin
sudo pacman -R --noconfirm xfce4-xkb-plugin

echo
tput setaf 2
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
