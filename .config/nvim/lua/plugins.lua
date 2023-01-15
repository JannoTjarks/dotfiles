return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Language Server Protocol
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

    -- UX/UI
    use 'glepnir/dashboard-nvim'
    use 'lewis6991/gitsigns.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use "Pocco81/true-zen.nvim"
    use "folke/twilight.nvim"
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'sindrets/diffview.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- File management/fuzzy finding
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'BurntSushi/ripgrep' } }
    }

    -- File format
    use { 'gpanders/editorconfig.nvim' }

    -- colorscheme
    use {
        'catppuccin/nvim',
        as = "catppuccin"
    }

    -- Shortcuts
    use 'preservim/nerdcommenter'
    use "folke/which-key.nvim"

    -- Lifequality
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
