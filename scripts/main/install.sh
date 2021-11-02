#!/bin/bash
# This script installs all packages and configfiles, removes old config filesset

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"
# Variables
unalias cp

# YAY
bash "$SCRIPT_DIR"/scripts/sub/yay_setup.sh

# Install Packages
bash "$SCRIPT_DIR"/scripts/sub/install_yay_packages.sh

# One Time Setup
bash "$SCRIPT_DIR"/scripts/sub/one-time-setup.sh

# Install Configs
bash "$SCRIPT_DIR"/scripts/sub/install_configs.sh
