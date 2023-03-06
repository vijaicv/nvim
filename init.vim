
set number
set hlsearch

syntax on
set termguicolors
set fileencoding=utf-8
set encoding=utf-8
set autoindent
set smartindent
set expandtab
set shiftwidth=4 
set splitright
set colorcolumn=90
set nowrap
set ic
set relativenumber
set mouse=a
set t_Co=256
set cursorline
set re=2

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git\|dist$\|.stack-work',
    \ 'file':'\.exe$|\.hie'
\ }
let g:ctrlp_working_path_mode = 'a'


let g:NERDTreeWinSize=30

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:NERDTreeShowHidden = 1
let g:airline_theme='onehalfdark'



call plug#begin('~/AppData/Local/nvim/plugged')
    Plug 'vim-airline/vim-airline'
"    Plug 'kien/ctrlp.vim'
    Plug 'morhetz/gruvbox'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'mattn/emmet-vim'
    Plug 'chun-yang/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'artanikin/vim-synthwave84'
    Plug 'adrian5/oceanic-next-vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'sirver/ultisnips'
    Plug 'sam4llis/nvim-tundra'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

colorscheme onehalfdark

nmap ,f :NERDTreeFind<CR>
nmap <Left> :b#<CR>
nnoremap <A-1> :NERDTreeToggle<CR>
nnoremap <C-\> :CocOutline<CR>
vmap <leader>y "+y
tnoremap <Esc> <C-\><C-n>

nnoremap <C-p> :GFiles<Cr>

" inoremap <silent><expr> <TAB>
 "      \ pumvisible() ? "\<C-n>" :
  "     \ CheckBackspace() ? "\<TAB>" :
   "    \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePost *.java !./gradlew spotlessapply
autocmd BufWritePost *.hs  !stack exec -- fourmolu -i <afile>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true }
}
EOF


