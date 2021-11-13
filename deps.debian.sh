#!/bin/sh

# Install required packages
sudo apt install -y compton network-manager network-manager-gnome xss-lock redshift notification-daemon libnotify-bin ranger imagemagick ark python3 python3-pip evince okular zenity xbacklight i3lock i3blocks git neovim feh fonts-hack fonts-font-awesome wget rxvt-unicode curl git sddm dmenu

# Install packages to build i3-gaps from source
sudo apt install -y meson gcc make autoconf automake pkg-config flex bison check

sudo apt install -y libpango1.0-dev libpangocairo-1.0-0 libcairo2-dev libglib2.0-dev librsvg2-dev libstartup-notification0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-xinerama0-dev libxcb-util0-dev libxcb-shape0-dev libxcb-cursor-dev libxcb-keysyms1-dev libyajl-dev libev-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xrm-dev


# Try building i3-gaps from source
tempdir=$(mktemp -d)

git clone https://github.com/Airblader/i3 "i3-gaps"

cd i3-gaps

mkdir -p build
cd build
meson --prefix /usr/ ..
ninja && sudo ninja install

cd ../..

rm -rf i3-gaps
