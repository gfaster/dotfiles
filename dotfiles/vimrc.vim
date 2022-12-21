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
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
"Plug 'ggandor/leap.nvim'
"Plug 'airblade/vim-gitgutter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completition engine

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Begin My config
" ---------------------------------------------------------------------------

let mapleader = ","

nnoremap <leader>f :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <F8> :TagbarToggle<CR>

inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

" Airline Config
let g:airline_theme='fairyfloss'
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
" https://en.wikipedia.org/wiki/Box-drawing_character
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
let g:airline_left_sep = '🭀'
let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
let g:airline_right_sep = '🭦'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' ℅:'
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = '☰ '
" let g:airline_symbols.dirty='⚡'
" END Airline config

" ALE config
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
nnoremap <leader>r :ALEResetBuffer<CR>
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '##'
let g:ale_sign_warning = '--'

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

"lua require('leap').add_default_mappings()

"set updatetime=1000
 
set mouse=
