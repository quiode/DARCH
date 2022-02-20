#!/bin/bash
# this scripts copies the config files from the repo to the correct location, it also doesn't break anything

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

# ZSH
cp -r "$SCRIPT_DIR"/configs/zsh/.zshrc "$HOME"/

# Locale
sudo cp -r "$SCRIPT_DIR"/configs/locale/locale.conf /etc/
sudo locale-gen

# Grub
cd "$SCRIPT_DIR" || exit
sudo cp -r "$SCRIPT_DIR"/configs/grub/grub /etc/default/
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Alacritty
cd "$SCRIPT_DIR" || exit
sudo cp -r "$SCRIPT_DIR"/configs/alacritty/alacritty.yml "$HOME"/.config/alacritty/

# XORG
cd "$SCRIPT_DIR" || exit
sudo cp -r "$SCRIPT_DIR"/configs/xorg/.xprofile "$HOME"/

# Awesome
cd "$SCRIPT_DIR" || exit
sudo chmod +x "$SCRIPT_DIR"/configs/awesome/autorun.sh
sudo cp -r "$SCRIPT_DIR"/configs/awesome "$HOME"/.config/

# # Qt5
# cd "$SCRIPT_DIR" || exit
# sudo cp -r "$SCRIPT_DIR"/configs/qt5ct "$HOME"/.config/

# .profile
cd "$SCRIPT_DIR" || exit
sudo cp -r "$SCRIPT_DIR"/configs/.profile "$HOME"/
