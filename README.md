# ubuntu-setup
My ubuntu setup script, made for setting up a new ubuntu installation
I still haven't tested this so it's gonna be up to future me

## What it installs
* guake
* neovim
* git
* firefox
* fd-find
* aptitude
* discord
* 1password (snap)
* thunderbird (snap)
* solarized-dark colorpack
* apparmor-profiles
* auditd
* audispd-plugins
* apparmor-utils
* git credential manager
* g++
* pip
* sublime text
* cmake
* universal-ctags
### Vim
* vim plug 
  * preservim/nerdtree
  * w0rp/ale
  * vim-airline/vim-airline
  * vim-airline/vim-airline-themes
  * myusuf3/numbers
  * tpope/vim-commentary
  * raimondi/delimitmate
  * nathanaelkane/vim-indent-guides
  * mg979/vim-visual-multi
  * ervandew/supertab
  * tpope/vim-fugitive
  * sheerun/vim-polyglot
  * xolox/vim-misc
  * majutsushi/tagbar

## Manual steps still needed:
- set colorpack, icons, and window manager theme in xfce
- remap super-up to maximize
- probably more git gcm setup
- 1password ssh credential manager
- setup for programs such as 1password, thunderbird, firefox

## TODO:
[X] include [fd](https://github.com/sharkdp/fd)
[ ] add `vi +%(line_number)s %(file_path)s -c 'normal zz'` to guake quick open
[ ] set guake theme to "solarized dark higher contrast"
[ ] add a solution to [this](https://github.com/snapcrafters/discord/issues/23) issue
[ ] Get leap (see HN article)
