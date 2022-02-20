#!/bin/bash
# one time setup, has to be run once and then never again, but doesn't break stuff if run multiple times
# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# use zsh terminal
sudo chsh -s /bin/zsh root
sudo chsh -s /bin/zsh "$USER"
# download and install oh-my-zsh
cd "$HOME" || exit
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# install zsh theme
cd "$HOME" || exit
wget https://github.com/dracula/zsh/archive/master.zip
unzip master.zip
mv zsh-master/dracula.zsh-theme "$HOME"/.oh-my-zsh/themes
if [ -d "$HOME"/.oh-my-zsh/themes/lib ]; then
    mv zsh-master/lib/* "$HOME"/.oh-my-zsh/themes/lib/
else
    mv zsh-master/lib/ "$HOME"/.oh-my-zsh/themes/
fi
sudo rm -r zsh-master
rm master.zip

# syntax highlighting
cd "$HOME" || exit
if [ -d "$HOME"/zsh-syntax-highlighting/ ]; then
    cd "$HOME"/zsh-syntax-highlighting/ || exit
    git pull
fi
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# keyboard layout
localectl set-x11-keymap ch

# Dracula Grub Theme
cd "$HOME" || exit
git clone https://github.com/dracula/grub.git
sudo cp -r grub/dracula /usr/share/grub/themes/
sudo rm -r grub

# Alacritty Theme
cd "$HOME" || exit
git clone https://github.com/dracula/alacritty
mkdir -p .config/alacritty
mv alacritty/dracula.yml .config/alacritty/
sudo rm -r alacritty

# Background image
mkdir -p "$HOME"/Pictures/Background/
cp -r "$SCRIPT_DIR"/images/ "$HOME"/Pictures/Background/

# GTK Dracula Theme
cd "$HOME" || exit
wget https://github.com/dracula/gtk/archive/master.zip
unzip master.zip
sudo rm -r master.zip
mv gtk-master Dracula
sudo mv Dracula /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Dracula"

# GTK Dracula Icons
cd "$HOME" || exit
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip Dracula.zip
sudo rm -r Dracula.zip
sudo mv Dracula /usr/share/icons/
gsettings set org.gnome.desktop.interface icon-theme "Dracula"

# Qt Dracula Theme
wget https://github.com/dracula/qt5/archive/master.zip
unzip master.zip
mkdir -p /usr/share/qt5ct/colors
mv qt5-master/Dracula.conf /usr/share/qt5ct/colors

# systemctl
sudo systemctl enable ntpd.service
sudo systemctl enable sddm.service
sudo systemctl enable snapd
