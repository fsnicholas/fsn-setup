#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
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

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

echo "Deleting current /etc/pacman.d/mirrorlist and replacing with"
echo
echo "Server = https://mirror.osbeck.com/archlinux/\$repo/os/\$arch
Server = http://mirror.osbeck.com/archlinux/\$repo/os/\$arch
Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch
Server = http://mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://mirror.rackspace.com/archlinux/\$repo/os/\$arch
Server = https://mirrors.kernel.org/archlinux/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist
echo
tput setaf 2
echo "########################################################################"
echo "Arch Linux Servers have been written to /etc/pacman.d/mirrorlist"
echo "Use nmirrorlist to inspect"
echo "########################################################################"
tput sgr0
echo

sudo pacman -Syy

echo
tput setaf 2
echo "################################################################"
echo "################### Core software"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed alacritty-themes
sudo pacman -S --noconfirm --needed arandr
sudo pacman -S --noconfirm --needed arc-darkest-theme-git
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed ast-firmware
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed bat
sudo pacman -S --noconfirm --needed catfish
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed doas
sudo pacman -S --noconfirm --needed downgrade
sudo pacman -S --noconfirm --needed dunst
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed gitahead-bin
#sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gtop
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hardinfo-gtk3
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed hw-probe
#sudo pacman -S --noconfirm --needed kvantum
sudo pacman -S --noconfirm --needed linux-firmware-qlogic
sudo pacman -S --noconfirm --needed lolcat
sudo pacman -S --noconfirm --needed lshw
sudo pacman -S --noconfirm --needed lxappearance
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages
#sudo pacman -S --noconfirm --needed mkinitcpio-firmware
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed most
sudo pacman -S --noconfirm --needed nerd-fonts-source-code-pro
sudo pacman -S --noconfirm --needed neofetch
#sudo pacman -S --noconfirm --needed nomacs
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed numlockx
#sudo pacman -S --noconfirm --needed openresolv
sudo pacman -S --noconfirm --needed pacutils
sudo pacman -S --noconfirm --needed paru-bin
sudo pacman -S --noconfirm --needed picom-git
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed python-pylint
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed rsync
sudo pacman -S --noconfirm --needed scrot
#sudo pacman -S --noconfirm --needed sardi-icons
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed surfn-icons-git
sudo pacman -S --noconfirm --needed the_platinum_searcher-bin
sudo pacman -S --noconfirm --needed tree
sudo pacman -S --noconfirm --needed ttf-bitstream-vera
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd
sudo pacman -S --noconfirm --needed ttf-meslo-nerd-font-powerlevel10k
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed variety
sudo pacman -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed wd719x-firmware
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed wttr
sudo pacman -S --noconfirm --needed xcolor
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed xorg-xkill
sudo pacman -S --noconfirm --needed yay-bin
sudo pacman -S --noconfirm --needed zsh
sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service

sudo pacman -S --noconfirm --needed rxvt-unicode
sudo pacman -S --noconfirm --needed urxvt-fullscreen
sudo pacman -S --noconfirm --needed urxvt-perls
sudo pacman -S --noconfirm --needed urxvt-resize-font-git

sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip

# for variety
sudo pacman -S --noconfirm --needed python-setuptools
sudo pacman -S --noconfirm --needed python-cairo

if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  sudo pacman -S --noconfirm --needed qt5ct
fi

###############################################################################################

# when on xfce

if [ -f /usr/share/xsessions/xfce.desktop ]; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Installing software for Xfce"
  echo "################################################################"
  tput sgr0
  echo

#  sudo pacman -S --noconfirm --needed menulibre
#  sudo pacman -S --noconfirm --needed mugshot
#  sudo pacman -S --noconfirm --needed prot16-xfce4-terminal
#  sudo pacman -S --noconfirm --needed tempus-themes-xfce4-terminal-git
  sudo pacman -S --noconfirm --needed xfce4-terminal-base16-colors-git

fi

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
