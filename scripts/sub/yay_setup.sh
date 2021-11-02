#!/bin/bash
# installs yay
sudo pacman -S --needed git base-devel
mkdir Programs
cd Programs || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si
yay -Y --gendb
yay -Syu --devel