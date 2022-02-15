#!/bin/bash
# installs all packages that can be installed with snap

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"

# checks if yay exists
cd "$SCRIPT_DIR"/packages/ || exit
xargs -a snap.txt snap install -S
