#!/bin/bash
# Removes DARCH folder if it is in the home folder
cd "$HOME" || exit
if [[ -d DARCH ]]; then
    sudo rm -r DARCH
fi
