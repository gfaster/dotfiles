" Plugins will be downloaded under the specified directory. shamelessly stolen
" from the Vim-Plug tutorial
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitmate'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Begin My config
" ---------------------------------------------------------------------------

let mapleader = ","

nnoremap <leader>f :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>

inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

let g:airline_theme='fairyfloss'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:airline#extensions#ale#enabled = 1

 
set mouse=
