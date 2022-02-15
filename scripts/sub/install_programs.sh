#!/bin/bash
# installs programs that can't be installed with yay

# Installs my scripts
cd "$HOME" || exit

git clone https://github.com/quiode/scripts
sudo chmod +x scripts/system-update/update-package-managers.sh
sudo mv scripts/system-update/update-package-managers.sh /opt
