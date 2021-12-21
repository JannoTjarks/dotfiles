"#######################################################################
"
" ~/.vimrc
" vim Konfigurationsdatei
"
"#######################################################################
" vim-plug
"
call plug#begin('~/.vim/plugged')
" Colorscheme dracula
Plug 'dracula/vim', { 'as': 'dracula' }
" Distraction-free writing
Plug 'junegunn/goyo.vim'
" Hyperfocus-writing
Plug 'junegunn/limelight.vim'
" Test
Plug 'reedes/vim-pencil'
" Markdown Language extension
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Go Language extension
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Powershell Language extension
Plug 'pprovost/vim-ps1'
" Dockerfile syntax extension
Plug 'ekalinin/Dockerfile.vim'
" Autocompletion
Plug 'maralla/completor.vim'
" Tree view
Plug 'preservim/nerdtree'
" Startpage
Plug 'mhinz/vim-startify'
" Terraform Language extension
Plug 'hashivim/vim-terraform'
call plug#end()

" Language Server
"
" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}

"#######################################################################
" Function
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  Pencil
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  PencilOff
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"#######################################################################
" File-based Settings
"
" PEP-8 default for python files
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Global Settings
"
colorscheme dracula

set nocompatible             " This option has the effect of making Vim either·
                             " more Vi-compatible, or make Vim behave in a more·
                             " useful way.
syntax enable                " Enables syntax highlighting
set encoding=utf8            " Sets the character encoding used inside Vim.

" Accessablity
set number                   " Print the line number in front of each line.
set showmode                 " If in Insert, Replace or Visual mode put a·
                             " message on the last line.
set ruler                    " Show the line and column number of the cursor
                             " position, separated by a comma.
set autoread                 " When a file has been detected to have been
                             " changed outside of Vim and it has not been
                             " changed inside of Vim, automatically read it
                             " again.
set backup                   " Make a backup before overwriting a file.

" Search
set incsearch                " While typing a search command, show where the
                             " pattern, as it was typed so far, matches.
set hlsearch                 " When there is a previous search pattern,
                             " highlight all its matches.
set ignorecase               " Ignore case in search patterns.
set smartcase                " Override the 'ignorecase' option if the search
                             " pattern contains uppercase characters.


" Tabs & Spaces
set tabstop=4                " Number of spaces that a <Tab> in the file counts
                             " for.
set softtabstop=4            " Number of spaces that a <Tab> counts for while
                             " performing editing operations, like inserting
                             " a <Tab> or using <BS>.
set shiftwidth=4             " Number of spaces to use for each step of
                             " (auto)indent.
set autoindent               " Copy indent from current line when starting a
                             " new line.
set expandtab                " In Insert mode: Use the appropriate number of
                             " spaces to insert a <Tab>.
set list                     " List mode: Show tabs as CTRL-I is displayed,
                             " display $ after end of line.  Useful to see the
                             " difference between tabs and spaces and for
                             " trailing blanks.
set listchars=tab:»·,trail:· " Tabs und Leerzeichen am Zeilenende anzeigen

"#######################################################################
" Macros
map <F2> i########################################################################<CR><ESC>
map <F3> :r!date +\%Y-\%m-\%d<CR>
map <F4> :r!date +\%Y-\%m-\%d_\%H-\%M-\%S<CR>

"#######################################################################
