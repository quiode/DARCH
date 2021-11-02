#!/bin/bash
# this scripts copies the config files from the repo to the correct location, it also doesn't break anything

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

# ZSH
cp -r "$SCRIPT_DIR"/configs/zsh/.zshrc "$HOME"/