local lsp = require('lsp-zero').preset({})

-- lsp.on_attach(function(_, bufnr)
--     lsp.default_keymaps({buffer = bufnr})
-- end)

-- Format files on save
-- Can configure what server and language
lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["gopls"] = { 'go' }
    }
})

local nvim_lsp = require('lspconfig')

-- Settings to recognize the internal NVIM api
nvim_lsp.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnokstics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("lua", true),
            },
            telematry = {
                enable = false
            }
        }
    }
})

-- Language Servers Config
-- Typescript & Javascript
nvim_lsp.denols.setup {
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    single_file_support = false
}

-- nvim_lsp.gopls.setup {
--     on_attach = on_attach,
--     cmd = { "gopls" },
--     root_dir = nvim_lsp.util.root_pattern("go.mod"),
--     settings = {
--         gopls = {
--             completeUnimported = true,
--             usePlaceholders = true,
--         }
--     }
-- }

lsp.ensure_installed({
    'tsserver',
    'denols',
    'eslint',
    'rust_analyzer',
    'html',
    'gopls'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
