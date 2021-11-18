#!/bin/sh

# Install the dotfiles
cp -arv home/. ~/

if [ "$1" = "--no-deps" ]; then
    exit 0
fi

DISTRO=$(cat /etc/os-release | sed -nr "s/^ID=(.*)$/\1/p")

# Install distro specific dependencies
case $DISTRO in 
    debian|ubuntu)
        sh deps.debian.sh
        break;;
    arch|manjaro)
        sh deps.arch.sh
        break;;
esac

sudo pip3 install deluge neovim
# Install vimplug in neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall
:UpdateRemotePlugins
:q!
:q!'

curl -fLo .urxvt/ext/font-size --create-dirs https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size

sudo systemctl enable sddm

