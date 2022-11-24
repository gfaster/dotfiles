#!bin/bash
set -e


install_bashrc() {
	# setup bash profile
	echo "installing bashrc to ~/.gfasters-bashrc"
	cp ./dotfiles/bashrc.sh ~/.gfasters-bashrc &&
		grep -Fq "source ~/.gfasters-bashrc" < ~/.bashrc || echo "source ~/.gfasters-bashrc" >> ~/.bashrc
}

install_vimrc() {
	# VIM setup
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
	echo "installing newsboat configs to ~/.newsboat/"
	mkdir -p ~/.newsboat
	cp ./dotfiles/newsboat_config ~/.newsboat/config
	cp ./dotfiles/newsboat_urls ~/.newsboat/urls
}

choose_installs() {
	case $1 in
		"all")
			install_bashrc
			install_vimrc
			install_newsboatconfigs
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
