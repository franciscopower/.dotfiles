set encoding=UTF-8

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()
" use :PlugInstall to install the plugins

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

call plug#end()

let g:airline_theme='light'

set termguicolors     " enable true colors support
" colorscheme nord
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

nmap <C-t> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFocus<CR>
nmap <C-l> :bnext<CR>
nmap <C-j> :bprevious<CR>
