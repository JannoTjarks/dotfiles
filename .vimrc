"#######################################################################
"
" ~/.vimrc
" vim Konfigurationsdatei
"
"#######################################################################
" File-based Settings
"
" PEP-8 default for python files
autocmd BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

" Settings for yaml file
autocmd FileType yaml set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79

" Settings for markdown file
autocmd FileType markdown set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

" Settings for shell scripts
autocmd FileType sh set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79

"#######################################################################
" Global Settings
"
" General VIM Settings
set nocompatible
syntax enable
set encoding=utf8
set backupdir=~/.vim/backups

" Accessablity
set shortmess+=c
set signcolumn=no
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

" Maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
