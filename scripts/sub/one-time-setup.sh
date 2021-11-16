#!/bin/bash
# one time setup, has to be run once and then never again, but doesn't break stuff if run multiple times
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

# Tilix Theme
cd "$HOME" || exit
git clone https://github.com/dracula/tilix.git
mkdir -p "$HOME"/.config/tilix/schemes/
cp -r tilix/dracula.json "$HOME"/.config/tilix/schemes/
sudo rm -r tilix

# systemctl
sudo systemctl enable ntpd.service
sudo systemctl enable sddm.service
