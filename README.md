# ubuntu-setup
My ubuntu setup script, made for setting up a new xubuntu installation
I still haven't tested a lot of this, so use at own peril

## What it installs
### apt:
see [packages_apt.txt](./packages_apt.txt) for repository packages

1password (directly from developer)

### snap:
* thunderbird
* firefox

### Other:
* solarized-dark colorpack

### Vim old
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
- 1password ssh credential manager
- setup for programs such as 1password, thunderbird, firefox

## TODO:
 * [ ] add a solution to [this](https://github.com/snapcrafters/discord/issues/23) issue
 * [ ] vim leader + l -> :e#
 * [ ] setup xmodmap rebinds although maybe use [this](https://wiki.archlinux.org/title/Map_scancodes_to_keycodes)
    * [ ] picom install + configs
    * [ ] write a custom window shader
    * [ ] disable panel + xdesktop + xfwm4 (session manager + `/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml`)
    * [ ] preserve xfce-terminal settings
 * [ ] Fira Code 12 Terminal font
