#!/bin/bash
# This script installs all packages and configfiles, removes old config filesset

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"

# Pacman keys
sudo pacman-key --init
sudo pacman-key --populate archlinux

# YAY
if ! command -v yay &>/dev/null; then
    bash "$SCRIPT_DIR"/scripts/sub/yay_setup.sh
fi

# Install Packages
bash "$SCRIPT_DIR"/scripts/sub/install_yay_packages.sh

# Install programs that can't be installed with yay
bash "$SCRIPT_DIR"/scripts/sub/install_programs.sh

# One Time Setup
bash "$SCRIPT_DIR"/scripts/sub/one-time-setup.sh

# Install Configs
bash "$SCRIPT_DIR"/scripts/sub/install_configs.sh

# After Install script
bash "$SCRIPT_DIR"/scripts/sub/after_install.sh
