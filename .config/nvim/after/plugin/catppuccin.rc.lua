vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        barbar = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,

        -- Special integrations, see https://github.com/catppuccin/nvim#special-integrations
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
        },
    },
})

vim.api.nvim_command "colorscheme catppuccin"
