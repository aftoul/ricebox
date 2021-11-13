#!/bin/sh

# Install required packages
sudo pacman --noconfirm -Syu sddm compton network-manager-applet xss-lock redshift notification-daemon libnotify ranger imagemagick ark python python-pip evince okular zenity xorg-xbacklight i3lock i3blocks git neovim feh ttf-font-awesome wget rxvt-unicode i3-gaps xorg-xrdb dmenu firefox ttf-hack alsa-utils base-devel deluge deluge-gtk picom

# Link to notification-daemon

sudo ln -sv /usr/lib/notification-daemon{-1.0,}/

# Install yay

tempdir=$(mktemp -d)

git clone https://aur.archlinux.org/paru-bin.git "$tempdir/paru"

pushd "$tempdir/paru"

makepkg -si --noconfirm

popd

rm -rf "$tempdir"

# Install i3blocks scripts
paru --cleanafter --answerclean A --answerdiff N --answerupgrade Y -Sy i3blocks-contrib-git
