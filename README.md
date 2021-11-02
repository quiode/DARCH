# DARCH

# Table of Contents

- [DARCH](#darch)
- [Table of Contents](#table-of-contents)
- [Introduction](#introduction)
- [Installation](#installation)
  - [Using the GitHub CLI](#using-the-github-cli)
  - [Using Git](#using-git)
- [Usage](#usage)

# Introduction

This repository is meant to easly setup a new Computer with my personal settings. It is meant to first cleanly install the [OS](https://anarchyinstaller.gitlab.io/) and then directely run the script. It is meant to just cleanly install Arch Linux and then run the script. The script then install the needed packages.

Versioning is done with a [version file](version.txt). The lines work as this:

1. Version of the config files
1. Version of the package list
1. Version of the additional programs
1. Version of the one time setup

# Installation

## Using the [GitHub CLI](https://github.com/cli/cli)

This is not tested as the GitHub Cli doesn't work on my machine.

```bash
pacman -S --needed git base-devel
gh clone quiode/DARCH
cd DARCH/scripts/main
chmod +x update.sh install.sh
./install.sh
```

## Using [Git](https://git-scm.com/)

```bash
pacman -S --needed github-cli base-devel
git clone https://github.com/quiode/DARCH
cd DARCH/scripts/main
chmod +x update.sh install.sh
./install.sh
```

# Usage

- Install the dotfiles with [install](./scripts/main/install.sh).
- Update the system with [update](./scripts/main/update.sh).
- After an installation, you can use the [DARCH]() script to update and install the dotfiles.

```
$ DARCH [install|update|--help]
```
