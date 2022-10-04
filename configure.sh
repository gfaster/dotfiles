#!bin/bash
set -e

# autostart guake
sudo cp /usr/share/applications/guake.desktop /etc/xdg/autostart/

# setup bash profile
cp ./.gfasters-bashrc ~/ &&
grep -Fq "source ~/.gfasters-bashrc" < ~/.bashrc || echo "source ~/.gfasters-bashrc" >> ~/.bashrc

# enable gcm - there is probably more to do here
git config --global credential.credentialStore "cache --timeout=86400"

# VIM setup
mkdir -p ~/.config/nvim
if [ -f ~/.config/nvim/init.vim ]; then
	grep -Fq "source ~/.vimrc" < ~/.config/nvim/init.vim || echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
else
	echo "source ~/.vimrc" > ~/.config/nvim/init.vim
fi
cp ./vimrc.vim ~/.vimrc
nvim +PlugInstall +qall
