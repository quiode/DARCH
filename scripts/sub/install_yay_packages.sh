#!/bin/bash
# installs all packages that can be installed with yay

# Constants
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
SCRIPT_DIR=$SCRIPT_DIR"/../../"

# checks if yay exists
if ! command -v yay &>/dev/null; then
    bash "$SCRIPT_DIR"/scripts/sub/yay_setup.sh
fi

cd "$SCRIPT_DIR"/packages/ || exit
xargs -a yay.txt yay -S
