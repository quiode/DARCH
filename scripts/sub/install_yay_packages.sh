#!/bin/bash
# installs all packages that can be installed with yay

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

filepath=$SCRIPT_DIR"/packages/yay.txt"
packages=''
while read -r line; do
    packages=$packages $line
done <"$filepath"
yay -S "$packages"
