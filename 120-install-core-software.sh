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
echo "Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch
Server = https://mirror.aarnet.edu.au/pub/archlinux/\$repo/os/\$arch
Server = http://au.mirrors.cicku.me/archlinux/\$repo/os/\$arch
Server = http://archlinux.mirror.digitalpacific.com.au/\$repo/os/\$arch
Server = https://archlinux.mirror.digitalpacific.com.au/\$repo/os/\$arch
Server = http://gsl-syd.mm.fcix.net/archlinux/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist
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

sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed alacritty-themes
sudo pacman -S --noconfirm --needed arandr
sudo pacman -S --noconfirm --needed arc-darkest-theme-git
sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed archlinux-logout-git
sudo pacman -S --noconfirm --needed archlinux-tweak-tool-git
sudo pacman -S --noconfirm --needed arcolinux-bin-git
sudo pacman -S --noconfirm --needed arcolinux-btop-git
sudo pacman -S --noconfirm --needed arcolinux-common-git
sudo pacman -S --noconfirm --needed arcolinux-config-all-desktops-git
sudo pacman -S --noconfirm --needed arcolinux-dconf-all-desktops-git
sudo pacman -S --noconfirm --needed arcolinux-gtk3-arcolinux-candy-beauty-git
sudo pacman -S --noconfirm --needed arcolinux-hblock-git
sudo pacman -S --noconfirm --needed arcolinux-arc-kde
sudo pacman -S --noconfirm --needed arcolinux-kvantum-git
sudo pacman -S --noconfirm --needed arcolinux-local-xfce4-git
sudo pacman -S --noconfirm --needed arcolinux-mirrorlist-git
sudo pacman -S --noconfirm --needed arcolinux-neofetch-git
sudo pacman -S --noconfirm --needed arcolinux-powermenu-git
sudo pacman -S --noconfirm --needed arcolinux-qt5-git
sudo pacman -S --noconfirm --needed arcolinux-rofi-git
sudo pacman -S --noconfirm --needed arcolinux-rofi-themes-git
sudo pacman -S --noconfirm --needed arcolinux-root-git
sudo pacman -S --noconfirm --needed arcolinux-system-config-git
sudo pacman -S --noconfirm --needed arcolinux-variety-autostart-git
sudo pacman -S --noconfirm --needed arcolinux-variety-git
sudo pacman -S --noconfirm --needed arcolinux-zsh-git
sudo pacman -S --noconfirm --needed ast-firmware
sudo pacman -S --noconfirm --needed autorandr 
sudo pacman -S --noconfirm --needed avahi
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed baobab
sudo pacman -S --noconfirm --needed bat
sudo pacman -S --noconfirm --needed betterlockscreen 
sudo pacman -S --noconfirm --needed btop
sudo pacman -S --noconfirm --needed catfish
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed curl
sudo pacman -S --noconfirm --needed dash
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed dbus-python
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed dex
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed doas
sudo pacman -S --noconfirm --needed downgrade
sudo pacman -S --noconfirm --needed dunst
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed exiv2
sudo pacman -S --noconfirm --needed eza
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed ffmpegthumbnailer
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed firefox-ublock-origin
sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed fzf
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed gitahead
sudo pacman -S --noconfirm --needed github-cli
sudo pacman -S --noconfirm --needed gnome-keyring
sudo pacman -S --noconfirm --needed grub-customizer
#sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gparted
#sudo pacman -S --noconfirm --needed gtop
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed gvfs-dnssd
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hardinfo2
sudo pacman -S --noconfirm --needed hblock
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed hw-probe
sudo pacman -S --noconfirm --needed inetutils
sudo pacman -S --noconfirm --needed inxi
sudo pacman -S --noconfirm --needed perl-cpanel-json-xs
sudo pacman -S --noconfirm --needed kvantum
sudo pacman -S --noconfirm --needed kvantum-qt5
sudo pacman -S --noconfirm --needed linux-firmware-qlogic
sudo pacman -S --noconfirm --needed lshw
sudo pacman -S --noconfirm --needed lxappearance-gtk3
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed mkinitcpio-firmware
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed most
sudo pacman -S --noconfirm --needed mousepad
sudo pacman -S --noconfirm --needed ncdu
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed nomacs-qt6-git
sudo pacman -S --noconfirm --needed npm
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed ntp
sudo pacman -S --noconfirm --needed numlockx
#sudo pacman -S --noconfirm --needed openresolv
sudo pacman -S --noconfirm --needed pacman-contrib
sudo pacman -S --noconfirm --needed pacmanlogviewer
# hook to check whether there are any packages marked as unrequired (orphans) 
# via pacman -Qttdq after every pacman run
#sudo pacman -S --noconfirm --needed pacman-log-orphans-hook
sudo pacman -S --noconfirm --needed pacutils
sudo pacman -S --noconfirm --needed pamac-aur
sudo pacman -S --noconfirm --needed paru-git
sudo pacman -S --noconfirm --needed picom-git
sudo pacman -S --noconfirm --needed pkgfile
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed python-beautifulsoup4
sudo pacman -S --noconfirm --needed python-keyutils
sudo pacman -S --noconfirm --needed python-pylint
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed python-xapp
sudo pacman -S --noconfirm --needed python-yaml
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed qt5ct
sudo pacman -S --noconfirm --needed qt6-base
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed ripgrep-all
sudo pacman -S --noconfirm --needed rofi
sudo pacman -S --noconfirm --needed rsync
sudo pacman -S --noconfirm --needed scrot
#sudo pacman -S --noconfirm --needed sardi-icons
sudo pacman -S --noconfirm --needed sofirem-git
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed sxhkd
sudo pacman -S --noconfirm --needed the_platinum_searcher-bin
sudo pacman -S --noconfirm --needed thunar
sudo pacman -S --noconfirm --needed thunar-archive-plugin
#sudo pacman -S --noconfirm --needed thunar-media-tags-plugin
sudo pacman -S --noconfirm --needed thunar-volman
sudo pacman -S --noconfirm --needed time
sudo pacman -S --noconfirm --needed tree
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed visual-studio-code-bin
sudo pacman -S --noconfirm --needed wd719x-firmware
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed wttr
sudo pacman -S --noconfirm --needed xorg-xkill
sudo pacman -S --noconfirm --needed xcolor
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed xfce4-mount-plugin
sudo pacman -S --noconfirm --needed xfce4-taskmanager
sudo pacman -S --noconfirm --needed xorg-xkill
sudo pacman -S --noconfirm --needed yay-git
sudo pacman -S --noconfirm --needed zenity
sudo pacman -S --noconfirm --needed zsh

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service

# music stuff
#sudo pacman -S --noconfirm --needed lollypop
#sudo pacman -S --noconfirm --needed playerctl
sudo pacman -S --noconfirm --needed vlc

# compressions
sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip

# fonts
sudo pacman -S --noconfirm --needed adobe-source-sans-fonts
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed nerd-fonts-source-code-pro
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed ttf-bitstream-vera
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack
sudo pacman -S --noconfirm --needed ttf-inconsolata
sudo pacman -S --noconfirm --needed ttf-jetbrains-mono-nerd
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-meslo-nerd-font-powerlevel10k
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family

# icons
sudo pacman -S --noconfirm --needed surfn-icons-git

# for variety
sudo pacman -S --noconfirm --needed variety
sudo pacman -S --noconfirm --needed python-setuptools
sudo pacman -S --noconfirm --needed python-cairo


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

sudo pacman -S --noconfirm --needed xfce4-terminal-base16-colors-git

fi

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
