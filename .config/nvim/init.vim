"" General VIM Settings
set nocompatible
syntax enable
set encoding=utf8
set backupdir=~/.vim/backups

" Accessablity
set mouse=
set shortmess+=c
set showmode
set signcolumn=yes
set ruler
set number
set autoread
set fileformat=unix
set backup
set conceallevel=3
set concealcursor-=n
set clipboard^=unnamed,unnamedplus


" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Tabs & Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set list
set listchars=tab:»·,trail:·

" Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

if has("nvim")
    lua require('plugins')
    set termguicolors

    " Disable search and mode because its shown in the lualine
    set shortmess+=S
    set noshowmode
endif
