#!/bin/bash
# installs all packages that can be installed with yay

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

cd "$SCRIPT_DIR"/packages/ || exit
xargs -a yay.txt yay -S
