#!/bin/sh


# Install required packages
sudo apt install compton connman-gtk xss-lock redshift notification-daemon libnotify-bin ranger ark python3 python3-pip evince okular zenity xbacklight i3lock i3blocks git flock

# Install packages to build i3-gaps from source
sudo apt install gcc make autoconf automake pkg-config flex bison check

sudo apt install libpango1.0-dev libpangocairo-1.0-0 libcairo2-dev libglib2.0-dev librsvg2-dev libstartup-notification0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-util-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xrm-dev


# Some python deps
sudo pip3 install deluge pywal colorz neovim

# Try building i3-gaps from source
git clone https://github.com/Airblader/i3

cd i3
mkdir build && cd build
../configure --disable-check
make && make install
cd ..


# Install the dotfiles
cp -r home/* ~/

# Install vimplug in neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ':PlugInstall
:UpdateRemotePlugins
:q!
:q!'



