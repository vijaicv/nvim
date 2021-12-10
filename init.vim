
set number
set hlsearch

syntax on
set termguicolors
set fileencoding=utf-8
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set splitright
set colorcolumn=90
set nowrap
set ic
set relativenumber

let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git\|dist$\|.stack-work',
    \ 'file':'\.exe$|\.hie'
\ }
let g:ctrlp_working_path_mode = 'a'

let g:NERDTreeWinSize=30

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1


call plug#begin('~/AppData/Local/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'kien/ctrlp.vim'
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'mattn/emmet-vim'
    Plug 'chun-yang/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'nbouscal/vim-stylish-haskell'
call plug#end()

colorscheme gruvbox

nnoremap <C-b> :NERDTreeToggle<CR>
tnoremap <Esc> <C-\><C-n>
