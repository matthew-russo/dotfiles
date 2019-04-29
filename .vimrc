call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Linting
Plug 'w0rp/ale'

" Tag management
Plug 'vim-scripts/taglist.vim'

" YouCompleteMe <3
Plug 'Valloric/YouCompleteMe'

" Git integration 
Plug 'tpope/vim-fugitive'

" Pretty status bar
Plug 'vim-airline/vim-airline'

" Search / Navigation utils
Plug 'scrooloose/nerdtree'
Plug 'wincent/Command-T'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nelstrom/vim-visual-star-search'

" Language extensions
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'digitaltoad/vim-pug'
Plug 'othree/yajs.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Clear indentations
Plug 'Yggdroot/indentLine'

call plug#end()

colorscheme gruvbox

set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set number
set hlsearch
set incsearch

au BufRead,BufNewFile *.es6 set filetype=javascript

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

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

