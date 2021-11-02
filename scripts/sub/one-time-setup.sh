#!/bin/bash
# one time setup, has to be run once and then never again, but doesn't break stuff if run multiple times
# use zsh terminal
sudo -s

chsh -s /bin/zsh root
chsh -s /bin/zsh "$USER"
# download and install oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh