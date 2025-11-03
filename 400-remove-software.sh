#!/bin/bash
#set -e
##################################################################################################################
##################################################################################################################
#
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

echo
tput setaf 3
echo "######################################################"
echo "################### Remove software for all"
echo "######################################################"
tput sgr0
echo

sudo pacman -Rs --noconfirm vim vim-runtime
sudo pacman -R --noconfirm archinstall
sudo pacman -Rs --noconfirm pragha 
sudo pacman -Rs --noconfirm lftp 
sudo pacman -Rs --noconfirm simplescreenrecorder

sudo pacman -Rs --noconfirm xf86-video-amdgpu 
sudo pacman -Rs --noconfirm xf86-video-fbdev 
sudo pacman -Rs --noconfirm xf86-video-openchrome
if pacman -Qi xf86-video-vmware &> /dev/null; then
  sudo pacman -Rs --noconfirm xf86-video-vmware
fi
sudo pacman -Rs --noconfirm xf86-video-ati
sudo pacman -Rs --noconfirm xf86-video-nouveau
sudo pacman -Rs --noconfirm xf86-video-vesa 
sudo pacman -R --noconfirm xfce4-artwork

# firmware
sudo pacman -Rs --noconfirm broadcom-wl-dkms
sudo pacman -Rs --noconfirm rtl8821cu-morrownr-dkms-git

sudo rm -rf  /usr/share/backgrounds/xfce

sudo pacman -R --noconfirm adobe-source-han-sans-cn-fonts
sudo pacman -R --noconfirm adobe-source-han-sans-jp-fonts
sudo pacman -R --noconfirm adobe-source-han-sans-kr-fonts

sudo pacman -R --noconfirm noto-fonts-cjk
sudo pacman -R --noconfirm noto-fonts-emoji
sudo pacman -R --noconfirm noto-fonts-extra

# remove conky stuff
sudo pacman -R --noconfirm conky-lua-archers
sudo pacman -R --noconfirm arcolinux-conky-collection-git
sudo pacman -R --noconfirm arcolinux-conky-collection-plasma-git"

# always put the current .bashrc .zshrc away
if [ -f /etc/skel/.bashrc ]; then
  sudo mv /etc/skel/.bashrc /etc/skel/.bashrc-old
fi

if [ -f /etc/skel/.zshrc ]; then
  sudo mv /etc/skel/.zshrc /etc/skel/.zshrc-old
fi

# when on ARCOLINUX - remove conflicting files

if grep -q "ArcoLinux" /etc/os-release; then
  echo
  tput setaf 2
  echo "######################################################"
  echo "####### Removing software for ArcoLinux"
  echo "######################################################"
  tput sgr0
  echo

sudo pacman -R --noconfirm arcolinux-conky-collection-git
sudo pacman -R --noconfirm arcolinux-local-applications-all-hide-git
sudo pacman -R --noconfirm arcolinux-pipemenus-git
sudo pacman -R --noconfirm arcolinux-welcome-app-git
sudo pacman -R --noconfirm arcolinux-xfce-panel-profiles-git
sudo pacman -R --noconfirm bibata-cursor-theme-bin
sudo pacman -R --noconfirm bubblewrap
sudo pacman -R --noconfirm cblas
sudo pacman -R --noconfirm chromaprint
sudo pacman -R --noconfirm clonezilla
sudo pacman -R --noconfirm conky-lua-archers
sudo pacman -Rns --noconfirm cups
sudo pacman -R --noconfirm cups-filters
sudo pacman -R --noconfirm cups-pdf
sudo pacman -Rns --noconfirm dav1d
sudo pacman -R --noconfirm firefox-adblock-plus
sudo pacman -R --noconfirm gnome-bluetooth
sudo pacman -R --noconfirm gnome-disk-utility
sudo pacman -R --noconfirm gst-plugins-bad
sudo pacman -R --noconfirm gst-plugins-good
sudo pacman -R --noconfirm gst-plugins-ugly
sudo pacman -R --noconfirm gutenprint
sudo pacman -R --noconfirm highway
sudo pacman -R --noconfirm jack2
sudo pacman -R --noconfirm kvantum-git
sudo pacman -R --noconfirm kvantum-qt5-git
sudo pacman -R --noconfirm lxappearance
sudo pacman -R --noconfirm mailcap
sudo pacman -R --noconfirm menulibre
sudo pacman -R --noconfirm mintstick-git
sudo pacman -R --noconfirm parole
sudo pacman -R --noconfirm partclone
sudo pacman -R --noconfirm parted
sudo pacman -R --noconfirm partimage
sudo pacman -Rns --noconfirm snappy
sudo pacman -R --noconfirm system-config-printer

sudo pacman -Rns --noconfirm wpebackend-fdo
echo these three part of wpebackend-fdo
sudo pacman -R --noconfirm webkit2gtk
sudo pacman -R --noconfirm webkit2gtk-4.1
sudo pacman -R --noconfirm webrtc-audio-processing

sudo pacman -R --noconfirm xfburn
sudo pacman -R --noconfirm xfwm4-themes
sudo pacman -R --noconfirm xvidcore
sudo pacman -R --noconfirm zsh-completions
sudo pacman -R --noconfirm zsh-syntax-highlighting



  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi

# when on EOS - remove conflicting files

if grep -q "EndeavourOS" /etc/os-release; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for EOS"
  echo "######################################################"
  tput sgr0
  echo

  sudo systemctl disable firewalld
  sudo pacman -R --noconfirm firewalld

  sudo pacman -R --noconfirm arc-gtk-theme-eos
  sudo pacman -Rdd --noconfirm eos-settings-xfce4
  sudo pacman -Rdd --noconfirm modemmanager modemmanager-qt
  #sudo pacman -R --noconfirm yay

  # sudo rm -r /etc/skel/.config/Kvantum
  # sudo rm -r /etc/skel/.config/gtk-3.0
  # sudo rm -r /etc/skel/.config/variety
  # sudo rm -r /etc/skel/.config/Thunar
  # sudo rm -r /etc/skel/.config/xfce4
  sudo rm /etc/skel/.config/xfce4/panel/whiskermenu-7.rc

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi

# when on ALCI - remove conflicting files

if [ -f /usr/local/bin/get-nemesis-on-alci ]; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for ALCI"
  echo "######################################################"
  tput sgr0
  echo

  sudo rm /etc/skel/.Xresources
  sudo pacman -R --noconfirm amd-ucode
  sudo pacman -R --noconfirm b43-fwcutter
  sudo pacman -R --noconfirm broadcom-wl
  sudo pacman -R --noconfirm broadcom-wl-dkms
  sudo pacman -Rs --noconfirm cloud-init
  sudo pacman -R --noconfirm darkhttpd
  sudo pacman -R --noconfirm dhcpcd
  sudo pacman -R --noconfirm ell
  sudo pacman -R --noconfirm grml-zsh-config
  sudo pacman -R --noconfirm iwd
  sudo pacman -R --noconfirm kitty-terminfo
  sudo pacman -R --noconfirm lftp
  sudo pacman -R --noconfirm livecd-sounds
  sudo pacman -R --noconfirm lua53
  sudo pacman -R --noconfirm luit
  sudo pacman -R --noconfirm lynx
  sudo pacman -R --noconfirm mousepad
  sudo pacman -R --noconfirm nmap
  sudo pacman -R --noconfirm parole
  sudo pacman -R --noconfirm systemd-resolvconf
  sudo pacman -R --noconfirm xbitmaps
  sudo pacman -R --noconfirm xfburn
  sudo pacman -R --noconfirm xterm
  sudo pacman -Rs --noconfirm brltty
  sudo pacman -Rs --noconfirm espeak-ng
  sudo pacman -Rs --noconfirm espeakup

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi


# when on Garuda - remove conflicting files

if grep -q "Garuda" /etc/os-release; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for Garuda"
  echo "######################################################"
  tput sgr0
  echo

  sudo pacman -R --noconfirm blueman
  sudo pacman -R --noconfirm garuda-xfce-settings
  sudo pacman -R --noconfirm garuda-common-settings
  sudo pacman -R --noconfirm garuda-bash-config
  sudo pacman -R --noconfirm redshift
  sudo pacman -Rs --noconfirm transmission-gtk
  sudo pacman -Rs --noconfirm geary
  sudo pacman -Rs --noconfirm celluloid
  sudo pacman -Rs --noconfirm pitivi
  sudo pacman -Rs --noconfirm audacity
  sudo pacman -Rs --noconfirm xfburn
  sudo pacman -Rs --noconfirm abiword
  sudo pacman -Rs --noconfirm veracrypt
  sudo pacman -Rs --noconfirm gtkhash
  sudo pacman -Rs --noconfirm onboard
  sudo pacman -Rs --noconfirm vim vim-runtime
  sudo pacman -Rs --noconfirm gestures
  sudo pacman -Rs --noconfirm pinta
  sudo pacman -Rdd --noconfirm hblock
  sudo pacman -Rdd --noconfirm modemmanager modem-manager-gui
  sudo pacman -Rdd --noconfirm linux-wifi-hotspot

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi


# when on SIERRA - remove conflicting files

if [ -f /usr/local/bin/get-nemesis-on-sierra ]; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for Sierra"
  echo "######################################################"
  tput sgr0
  echo

  sudo pacman -R --noconfirm amd-ucode
  sudo pacman -R --noconfirm b43-fwcutter
  sudo pacman -R --noconfirm broadcom-wl
  sudo pacman -R --noconfirm broadcom-wl-dkms
  sudo pacman -Rs --noconfirm cloud-init
  sudo pacman -R --noconfirm darkhttpd
  sudo pacman -R --noconfirm dhcpcd
  sudo pacman -R --noconfirm ell
  sudo pacman -R --noconfirm grml-zsh-config
  sudo pacman -R --noconfirm iwd
  sudo pacman -R --noconfirm kitty-terminfo
  sudo pacman -R --noconfirm lftp
  sudo pacman -R --noconfirm livecd-sounds
  sudo pacman -R --noconfirm lua53
  sudo pacman -R --noconfirm luit
  sudo pacman -R --noconfirm lynx
  sudo pacman -R --noconfirm mousepad
  sudo pacman -R --noconfirm nmap
  sudo pacman -R --noconfirm parole
  sudo pacman -R --noconfirm systemd-resolvconf
  sudo pacman -R --noconfirm xbitmaps
  sudo pacman -R --noconfirm xfburn
  sudo pacman -R --noconfirm xterm
  sudo pacman -Rs --noconfirm brltty
  sudo pacman -Rs --noconfirm espeak-ng
  sudo pacman -Rs --noconfirm espeakup

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi

echo
tput setaf 6
echo "######################################################"
echo "################### Done"
echo "######################################################"
tput sgr0
echo

# when on Archman - remove conflicting files

if grep -q "Archman" /etc/os-release; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for Archman"
  echo "######################################################"
  tput sgr0

  sudo systemctl disable firewalld
  sudo pacman -R --noconfirm firewalld
  sudo pacman -R --noconfirm imagewriter
  sudo pacman -R --noconfirm surfn-icons
  sudo pacman -R --noconfirm grml-zsh-config

  sudo rm -r /etc/skel/.config/Thunar
  sudo rm -r /etc/skel/.config/xfce4

  sudo rm /etc/skel/.config/mimeapps.list
  sudo rm /etc/skel/.face
  sudo rm /etc/skel/.xinitrc

  sudo rm /etc/X11/xorg.conf.d/99-killX.conf
  sudo rm /etc/modprobe.d/disable-evbug.conf
  sudo rm /etc/modprobe.d/nobeep.conf

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi


# when on Archcraft - remove conflicting files
if grep -q "archcraft" /etc/os-release; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for Archcraft"
  echo "######################################################"
  tput sgr0
  echo

  sudo rm -r /etc/skel/.config/*
  sudo rm /etc/skel/.dmrc
  sudo rm /etc/skel/.face
  sudo rm /etc/skel/.gtkrc-2.0

  sudo pacman -R --noconfirm archcraft-skeleton
  sudo pacman -R --noconfirm archcraft-omz
  sudo pacman -R --noconfirm archcraft-skeleton
  sudo pacman -R --noconfirm archcraft-openbox
  sudo pacman -R --noconfirm archcraft-gtk-theme-arc
  sudo pacman -R --noconfirm archcraft-config-qt
  #sudo pacman -R --noconfirm archcraft-neofetch

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi
