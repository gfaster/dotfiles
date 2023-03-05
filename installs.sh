#!/bin/bash
set -e

sudo apt update
mkdir -p tmp


# Install apt packages
set +e
cat packages_apt.txt | grep -v '^[ \t]*#' | grep -v "^$" |
    while IFS= read -r line; do
        sudo apt -y install $line
    done
set -e

# Fonts
# --------------------
# curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/DejaVuSansMono.zip > ./tmp/DejaVuSansMono.zip
# curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip > ./tmp/FiraCode.zip


# General tools
# --------------------
which starship || cargo install starship --locked


# Needs to be set manually in xfce
# TODO: auto set theme, icons, and window manager theme
curl -L https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.3.tar.gz > ./tmp/solarized.tar.gz
tar -xf ./tmp/solarized.tar.gz -C ./tmp/
sudo tar -xf ./tmp/rtl88-Themes-1.3/solarized-dark-gtk-theme-colorpack_1.3.tar.gz -C /usr/share/themes

# Security
# --------------------

# Dev tools
# --------------------

# VIM setup (initial install above)
#---------------------

# vim package manager
test ~/.local/share/nvim/site/autoload/plug.vim ||
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Cleanup
# ----------------------
rm -rf ./tmp
sudo apt -y autoremove
