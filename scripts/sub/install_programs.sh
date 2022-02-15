#!/bin/bash
# installs programs that can't be installed with yay

# Installs my scripts
cd "$HOME" || exit

git clone https://github.com/quiode/scripts
sudo chmod +x scripts/scripts/system-update/update-package-managers
sudo mv scripts/scripts/system-update/update-package-managers /opt
sudo rm -r scripts # cleanup
