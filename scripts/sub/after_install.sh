#!/bin/bash
# Removes DARCH folder if it is in the home folder
cd "$HOME" || exit
if [[ -d DARCH ]]; then
    sudo rm -r DARCH
fi
# Gives message after install
echo -e "\e[00;34m- Set dracula theme in tilix.\e[00m"
