" Set leader keys
let g:mapleader = " "
let g:maplocalleader = "\\"

" General options
set noswapfile
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set wrap
set splitright
set scrolloff=8
set sidescrolloff=8
set shadafile=NONE

" Search options
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Folds
set foldmethod=indent
set foldlevel=99
set nofoldenable

" Highlight FloatBorder
highlight FloatBorder guifg=#d8bd92

" Keymaps
" CTRL+s to save in normal or input mode
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" CTRL+w to quit
nnoremap <leader>wc :q<CR>

" Close buffer
nnoremap <leader>bc :bdelete<CR>

" Switch between buffers
nnoremap <leader>bh :bprevious<CR>
nnoremap <leader>bl :bnext<CR>

" Split panes
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>

" Switch between panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize panes
nnoremap <C-A-h> :vertical resize -5<CR>
nnoremap <C-A-l> :vertical resize +5<CR>
nnoremap <C-A-j> :resize -5<CR>
nnoremap <C-A-k> :resize +5<CR>

" Switch between tabs
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnew<CR>

" Keep cursor in the middle with certain moves
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Paste without yanking
xnoremap <leader>p "_dP

" Yank into system clipboard
nnoremap <C-c> "+y
vnoremap <C-c> "+y

" Paste from system clipboard
nnoremap <C-v> "+p
vnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa

" Navigate to start and end of line
nnoremap H ^
nnoremap L $

" Replace all occurrences of the selected block
vnoremap <leader>s "hy:%s/<C-r>h//g<left><left>
vnoremap <leader>/ "hy/<C-r>h
