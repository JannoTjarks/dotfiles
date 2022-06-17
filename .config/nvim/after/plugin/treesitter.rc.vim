if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "typescript",
        "javascript",
        "toml",
        "json",
        "yaml",
        "html",
        "scss",
        "css",
        "bash",
        "markdown",
        "dockerfile",
        "go",
        "python",
        "hcl",
        "c"
    },
    autotag = {
        enable = true,
    }
}
EOF
