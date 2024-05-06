#!bin/bash


install_bashrc() {
	echo "installing bashrc to ~/.gfasters-bashrc"
	cp ./dotfiles/bashrc.sh ~/.gfasters-bashrc &&
		grep -Fq "source ~/.gfasters-bashrc" < ~/.bashrc || echo "source ~/.gfasters-bashrc" >> ~/.bashrc
	echo "installing bash_profile to ~/.bash_profile"
	cp ./dotfiles/bash_profile.sh ~/.bash_profile
	echo "installing profile.sh to ~/.profile"
	cp ./dotfiles/profile.sh ~/.profile
}

install_vimrc() {
	echo "installing vimrc to ~/.config/nvim/init.lua"
	mkdir -p ~/.config/nvim
	cp ./dotfiles/nvim/init.lua ~/.config/nvim/init.lua
}

install_newsboatconfigs() {
	target="~/.newsboat"
	echo "installing newsboat configs to $target"
	mkdir -p $target
	cp ./dotfiles/newsboat_config $target/config
	cp ./dotfiles/newsboat_urls $target/urls
}

install_lynxconfigs() {
	target="~/.config/lynx"
	echo "installing lynx configs to $target"
	mkdir -p $target
	cp ./dotfiles/lynx.lss ~/.config/lynx/lynx.lss
}

install_i3() {
	echo "installing i3 and i3status config to ~/.config/i3(status)"
	mkdir -p ~/.config/i3/
	mkdir -p ~/.config/i3status/
	cp ./dotfiles/i3config ~/.config/i3/config
	cp ./dotfiles/i3statusconfig ~/.config/i3status/config
	i3-msg restart || true
}

install_starship() {
	echo "installing starship.toml to ~/.config/starship.toml"
	cp ./dotfiles/starship.toml ~/.config/starship.toml
}

install_rofi() {
	echo "installing rofi.rasi to ~/.config/rofi/config.rasi"
	mkdir -p ~/.config/rofi
	cp ./dotfiles/rofi.rasi ~/.cofig/rofi/config.rasi
}

install_background() {
	echo "installing background to /usr/share/backgrounds"
	mkdir -p ~/.local/share/backgrounds
	cp ./data/creation_background.png ~/.local/share/backgrounds/
	cp ./data/jwst_1_1920.png ~/.local/share/backgrounds/
	cp ./data/jwst_1_1920_blur.png ~/.local/share/backgrounds/
	feh --bg-fill ~/.local/share/backgrounds/jwst_1_1920.png
}


choose_installs() {
	case $1 in
		"all")
			install_bashrc
			install_newsboatconfigs
			install_background
			install_starship
			install_rofi
			install_vimrc
			;;
		"bashrc")
			install_bashrc
			;;
		"vimrc")
			install_vimrc
			;;
		"newsboat")
			install_newsboatconfigs
			;;
		"background")
			install_background
			;;
		"i3")
			install_i3
			install_background
			;;
		"starship")
			install_starship
			;;
		"rofi")
			install_rofi
			;;
		"lynx")
			install_lynxconfigs
			;;
		\?)
			echo "Unknown install"
			exit 1
			;;
	esac
}


while getopts ":i:I" opt; do
	case $opt in
		i)
			set -e
			choose_installs "$OPTARG"
			;;
		I)
			choose_installs all
			;;
		\?)
			echo "Unknown option $OPTARG"
			exit 1
			;;
	esac
done
