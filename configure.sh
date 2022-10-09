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



# Settings - I need to check if this may change
xfconf-query -c xfce4-panel -p /plugins/plugin-12/digital-format -s "%Y-%m-%d %l:%M %p (%a)"

# Parts of this were stolen from: https://github.com/ukncsc/Device-Security-Guidance-Configuration-Packs/blob/main/Linux/UbuntuLTS/
# -------------------------------------
# Disable spyware
sudo systemctl stop apport.service
sudo systemctl disable apport.service
sudo systemctl mask apport.service

sudo systemctl stop whoopsie.service
sudo systemctl disable whoopsie.service
sudo systemctl mask whoopsie.service

sudo systemctl stop ua-messaging.timer
sudo systemctl disable ua-messaging.timer
sudo systemctl mask ua-messaging.timer

sudo systemctl stop ua-messaging.service
sudo systemctl diable ua-messaging.service
sudo systemctl mask ua-messaging.service

sudo systemctl stop ua-timer.timer
sudo systemctl disable ua-timer.timer
sudo systemctl mask ua-timer.timer

sudo rm /etc/apt/apt.conf.d/20apt-esm-hook.conf

sudo apt-get remove -y popularity-contest

# Set some AppArmor profiles to enforce mode.
# avahi broadcasts on local network
sudo aa-enforce /etc/apparmor.d/usr.bin.firefox
sudo aa-enforce /etc/apparmor.d/usr.sbin.avahi-daemon
sudo aa-enforce /etc/apparmor.d/usr.sbin.dnsmasq
sudo aa-enforce /etc/apparmor.d/bin.ping
sudo aa-enforce /etc/apparmor.d/usr.sbin.rsyslogd
