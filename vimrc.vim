" Plugins will be downloaded under the specified directory. shamelessly stolen
" from the Vim-Plug tutorial
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Begin My config
" ---------------------------------------------------------------------------

:let mapleader = ","


