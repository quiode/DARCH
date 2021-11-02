#!/bin/bash
# installs all packages that can be installed with yay

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

filepath=$SCRIPT_DIR"/packages/yay.txt"
xargs yay -S <"$filepath"
