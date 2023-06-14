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

# Rust
if ! which rustup ; then
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
fi


# General tools
# --------------------
which starship || cargo install starship --locked
which alacritty || cargo install alacritty --locked


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
