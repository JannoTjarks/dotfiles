return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'dracula/vim'

    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'
    use 'L3MON4D3/LuaSnip'

    use 'lewis6991/gitsigns.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'}, {'BurntSushi/ripgrep'} }
    }

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'} 
    }
    use {
        'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'scrooloose/nerdtree'
    use 'preservim/nerdcommenter'
    use "lukas-reineke/indent-blankline.nvim"

    use 'hashivim/vim-terraform'
end)
