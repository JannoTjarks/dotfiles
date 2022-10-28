if !exists('g:lspconfig')
    finish
endif

lua <<EOF
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- mappings
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions 
    buf_set_keymap('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- formatting
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      vim.api.nvim_command [[augroup END]]
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').jsonls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').yamlls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').bashls.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig').powershell_es.setup{
    bundle_path = '/home/janno/.local/bin/powershell-editor-services',
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.omnisharp.setup {
    cmd = { "dotnet", "/home/janno/.local/bin/omnisharp/OmniSharp.dll" },
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.jedi_language_server.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require'lspconfig'.sumneko_lua.setup {
    cmd = { "/home/janno/.local/bin/lua-language-server/bin/lua-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
EOF
