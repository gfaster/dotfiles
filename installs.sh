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
sudo apt -y install fd-find
sudo apt -y install aptitude

# TODO: include 1password cli (https://developer.1password.com/docs/cli/get-started/)
# TODO: install via apt and verify signature (https://support.1password.com/install-linux/)
snap install 1password

snap install thunderbird

sudo apt -y install discord


# Needs to be set manually in xfce
# TODO: auto set theme, icons, and window manager theme
curl -L https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.3.tar.gz > ./tmp/solarized.tar.gz
tar -xf ./tmp/solarized.tar.gz -C ./tmp/
sudo tar -xf ./tmp/rtl88-Themes-1.3/solarized-dark-gtk-theme-colorpack_1.3.tar.gz -C /usr/share/themes

# Security
# --------------------
# sudo apt -y install gnome-lokkit
sudo apt -y install apparmor-profiles
sudo apt -y install auditd
sudo apt -y install audispd-plugins
sudo apt -y install apparmor-utils

# Dev tools
# --------------------

# git credential manager
if [ ! -x git-credential-manager-core; ]; then  
	curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh &&
	sh ./install-from-source.sh &&
	git-credential-manager-core configure
fi
sudo apt -y install g++
sudo apt -y install python3-pip
sudo apt -y install subl
sudo apt -y install cmake
sudo apt -y install universal-ctags

#TODO: Mutt download and install - getting that working might be a pain
# VIM setup (initial install above)
#---------------------
# vim package manager
test ~/.local/share/nvim/site/autoload/plug.vim ||
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Cleanup
# ----------------------
rm -rf ./tmp
sudo apt -y autoremove
