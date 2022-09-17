#!/bin/bash
set -e

sudo apt update
mkdir tmp

# General tools
# --------------------

sudo apt -y install guake

sudo apt -y install neovim

sudo apt -y install git

sudo apt -y install firefox

sudo apt -y install curl

# TODO: include 1password cli (https://developer.1password.com/docs/cli/get-started/)
snap install 1password

snap install thunderbird

sudo apt -y install discord


# Needs to be set manually in xfce
# TODO: auto set theme, icons, and window manager theme
curl -L https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.3.tar.gz > ./tmp/solarized.tar.gz
tar -xf ./tmp/solarized.tar.gz -C ./tmp/
sudo tar -xf ./tmp/rtl88-Themes-1.3/solarized-dark-gtk-theme-colorpack_1.3.tar.gz -C /usr/share/themes


# Dev tools
# --------------------

# git credential manager
curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
sh ./install-from-source.sh &&
git-credential-manager-core configure

sudo apt -y install g++

sudo apt -y install python3-pip

sudo apt -y install subl


# Cleanup
----------------------
rm -rf ./tmp
