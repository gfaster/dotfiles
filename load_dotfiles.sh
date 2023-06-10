#!bin/bash
set -e


install_bashrc() {
	echo "installing bashrc to ~/.gfasters-bashrc"
	cp ./dotfiles/bashrc.sh ~/.gfasters-bashrc &&
		grep -Fq "source ~/.gfasters-bashrc" < ~/.bashrc || echo "source ~/.gfasters-bashrc" >> ~/.bashrc
}

install_vimrc() {
	echo "installing vimrc to ~/.vimrc"
	mkdir -p ~/.config/nvim
	if [ -f ~/.config/nvim/init.vim ]; then
		grep -Fq "source ~/.vimrc" < ~/.config/nvim/init.vim || echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
	else
		echo "source ~/.vimrc" > ~/.config/nvim/init.vim
	fi
	cp ./dotfiles/vimrc.vim ~/.vimrc
	nvim +PlugInstall +qall
}

install_newsboatconfigs() {
	target="~/.newsboat"
	echo "installing newsboat configs to $target"
	mkdir -p $target
	cp ./dotfiles/newsboat_config $target/config
	cp ./dotfiles/newsboat_urls $target/urls
	test -e ./dotfiles/newsboat_urls.private && cat ./dotfiles/newsboat_urls.private >> $target/urls
	chmod 640 $target/urls; chmod 640 ./dotfiles/newsboat_urls.private
}

install_lynxconfigs() {
	target="~/.config/lynx"
	echo "installing lynx configs to $target"
	sudo mkdir -p $target
	sudo cp ./dotfiles/lynx.lss $target/lynx.lss
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

install_background() {
	echo "installing background to /usr/share/backgrounds"

}

install_fish() {
	echo "installing config.fish to ~/.config/fish/config.fish"
	cp ./dotfiles/config.fish ~/.config/fish/config.fish
}


choose_installs() {
	case $1 in
		"all")
			install_bashrc
			install_vimrc
			install_newsboatconfigs
			install_background
			install_starship
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
		"i3")
			install_i3
			install_background
			;;
		"starship")
			install_starship
			;;
		"fish")
			install_fish
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


while getopts ":i:g:IG" opt; do
	case $opt in
		i)
			choose_installs "$OPTARG"
			;;
		g)
			echo "-g was used with $OPTARG"
			;;
		I)
			choose_installs all
			;;
		G) 
			echo "Get all"
			;;
		\?)
			echo "Unknown option $OPTARG"
			exit 1
			;;
	esac
done
