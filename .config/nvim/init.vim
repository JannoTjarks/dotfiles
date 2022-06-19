"" General VIM Settings
set nocompatible
syntax enable
set encoding=utf8
set backupdir=~/.vim/backups

" Accessablity
set shortmess+=c
set signcolumn=yes
set showmode
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

runtime ./maps.vim

if has("nvim")
    lua require('plugins')
    colorscheme dracula
endif
