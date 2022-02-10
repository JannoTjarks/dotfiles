"" File-based Settings

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
    \ conceallevel=3
    \ concealcursor=v
autocmd FileType markdown let b:indentLine_enabled = 0

" Settings for shell scripts
autocmd FileType sh set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79
