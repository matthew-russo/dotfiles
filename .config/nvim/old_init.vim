call plug#begin('~/.config/nvim/plugged')

" Theme
Plug 'morhetz/gruvbox'
Plug 'yorickpeterse/happy_hacking.vim'

Plug 'w0rp/ale' " Linting
Plug 'majutsushi/tagbar' "Tag management
Plug 'tpope/vim-fugitive' " Git integration
Plug 'vim-airline/vim-airline' " Pretty status bar

" Search / Navigation utils
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'wincent/Command-T'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search' " allows using '*' to search for currently selected text
set rtp+=~/.fzf

" Language extensions and source formatting
Plug 'Yggdroot/indentLine' " Clear indentations
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'
Plug 'ziglang/zig.vim'

call plug#end()

colorscheme gruvbox
" colorscheme happy_hacking

filetype plugin indent on

set shell=/bin/bash

" Don't overwrite value set by autocommand
if expand('%:t') == 'makefile'
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
else
  set expandtab
  set softtabstop=2
  set shiftwidth=2
endif

set autoindent
set mouse=a
set number
set hlsearch
set incsearch
set colorcolumn=80,120

"==============================
"
"          Ale Config
"
"==============================
let g:ale_completion_enabled = 1

let g:ale_java_eclipselsp_path = "/home/rsmatth/eclipse.jdt.ls"

let g:ale_linters = {
  \   'java': ['eclipselsp'],
  \   'go': ['gopls'],
  \   'python': ['flake8', 'mypy', 'pylint', 'pyls'],
  \   'rust': ['cargo', 'rls'],
  \   'ruby': ['solargraph'],
\}

let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\   'ruby': ['rubocop'],
\}

"==============================
"
"         Ctags Config
"
"==============================

let g:tagbar_ctags_bin = '/usr/local/bin/exctags'
let g:airline#extensions#tagbar#enabled = 0

"==============================
"
"         Key Mappings
"
"==============================
" moves line down
noremap - ddp
" moves line up
noremap _ ddkkp

" uppercases the current word
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" replaces the current word with whatever is in currently yanked, and re-yanks
" that word if you want to change multiple instances of the same thing
" its a little janky and needs to be fixed cause if you do it on the first
" character of a word, it doesn't work
nnoremap `` bvepvby

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Re-select visual block after indenting
vnoremap < <gv
vnoremap > >gv

" display Tagbar window on F8 press
nnoremap <F8> :TagbarToggle<CR>

" Next and previous ALE errors/warnings
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

"==============================
"
"          javascript
"
"==============================
au BufRead,BufNewFile *.es6 set filetype=javascript


"==============================
"
"           Haskell
"
"==============================
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
