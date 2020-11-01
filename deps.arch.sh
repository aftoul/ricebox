#!/bin/sh

# Install required packages
sudo pacman --noconfirm -Syu sddm compton network-manager-applet xss-lock redshift notification-daemon libnotify ranger imagemagick ark python python-pip evince okular zenity xorg-xbacklight i3lock i3blocks git neovim feh ttf-font-awesome wget rxvt-unicode i3-gaps base-devel

# Install yay

tempdir=$(mktemp -d)

git clone https://aur.archlinux.org/yay-git.git "$tempdir/yay-git"

pushd "$tempdir/yay-git"

makepkg -si --noconfirm

popd

rm -rf "$tempdir"

# Install Hack font
yay --cleanafter --answerclean A --answerdiff N --answerupgrade Y -Sy nerd-fonts-hack

