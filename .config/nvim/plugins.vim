"" Plugins for (Neo)Vim with vim-plug
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/which-key.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pprovost/vim-ps1'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

