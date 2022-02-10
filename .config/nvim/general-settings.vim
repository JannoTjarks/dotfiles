"" General VIM Settings

set nocompatible              " This option has the effect of making Vim 
                              " either·more Vi-compatible, or make Vim behave 
                              " in a more·useful way.
syntax enable                 " Enables syntax highlighting
set encoding=utf8             " Sets the character encoding used inside Vim.
set backupdir=~/.vim/backups  " List of directories for the backup file,
                              " separated with commas.

" Accessablity
set cmdheight=2               " Better display for messages
set shortmess+=c              " don't give |ins-completion-menu| messages.
set signcolumn=yes            " always show signcolumns
set showmode                  " If in Insert, Replace or Visual mode put a
                              " message on the last line.
set ruler                     " Show the line and column number of the cursor
                              " position, separated by a comma.
set number                    " Print the line number in front of each line.
set autoread                  " When a file has been detected to have been
                              " changed outside of Vim and it has not been
                              " changed inside of Vim, automatically read it
                              " again.
set fileformat=unix           " Sets fileformat to unix style (each line ends
                              " with an LF character)
set backup                    " Make a backup before overwriting a file.
set conceallevel=3            " Determine how text with the conceal syntax
                              " attribute :syn-conceal is shown
set concealcursor-=n          " Sets the modes in which text in the cursor line
                              " can also be concealed.
set clipboard^=unnamed,unnamedplus " Using system clipboard

" Search
set incsearch                 " While typing a search command, show where the
                              " pattern, as it was typed so far, matches.
set hlsearch                  " When there is a previous search pattern,
                              " highlight all its matches.
set ignorecase                " Ignore case in search patterns.
set smartcase                 " Override the 'ignorecase' option if the search
                              " pattern contains uppercase characters.

" Tabs & Spaces
set tabstop=4                 " Number of spaces that a <Tab> in the file
                              " counts for.
set softtabstop=4             " Number of spaces that a <Tab> counts for while
                              " performing editing operations, like inserting
                              " a <Tab> or using <BS>.
set shiftwidth=4              " Number of spaces to use for each step of
                              " (auto)indent.
set autoindent                " Copy indent from current line when starting a
                              " new line.
set expandtab                 " In Insert mode: Use the appropriate number of
                              " spaces to insert a <Tab>.
set list                      " List mode: Show tabs as CTRL-I is displayed,
                              " display $ after end of line.  Useful to see the
                              " difference between tabs and spaces and for
                              " trailing blanks.
set listchars=tab:»·,trail:·  " Tabs und Leerzeichen am Zeilenende anzeigen

