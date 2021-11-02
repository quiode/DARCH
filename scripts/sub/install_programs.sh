#!/bin/bash
# installs programs that can't be installed with yay
filepath=$SCRIPT_DIR"/packages/yay.txt"
packages=''
while read -r line; do
    packages="$packages $line"
done <"$filepath"
yay -S "$packages"
