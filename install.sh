#!/bin/sh

DISTRO=$(cat /etc/os-release | sed -nr "s/^ID=(.*)$/\1/p")

case $DISTRO in 
    debian|ubuntu)
        sh deps.debian.sh
        break;;
    arch|manjaro)
        sh deps.arch.sh
        break;;
esac

sudo pip3 install deluge neovim

# Install the dotfiles
cp -arv home/. ~/

mkdir -p ~/Pictures/wallpapers

# Install vimplug in neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall
:UpdateRemotePlugins
:q!
:q!'

sudo systemctl enable sddm

