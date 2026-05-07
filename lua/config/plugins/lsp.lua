local function configure_keymaps()
    vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
        },
    })

    -- keymap configs
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
end

local function configure_cmp()
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
        })
    })
end

local function configure_lsp_servers()
    vim.lsp.config('gopls', {
        cmd = { 'gopls' },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { '.go', '.mod' }
    })

    vim.lsp.config('clangd', {
        cmd = { 'clangd' },
        root_markers = { '.clangd', 'compile_commands.json' },
        filetypes = { 'c', 'cpp' }
    })

    vim.lsp.config('ols', {})

    vim.lsp.config('zls',{})

    vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = { 'typescriptreact', 'typescript', 'javascript' },
        root_markers = { 'package.json', 'deno.json' }
    })
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            configure_cmp()
            configure_keymaps()
            configure_lsp_servers()
        end
    }
}
