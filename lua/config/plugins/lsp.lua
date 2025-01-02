return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        config = function()
            -- server configs
            local config = require('lspconfig')

            config.lua_ls.setup {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { '.luarc.json', '.luarc.jsonc' },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        }
                    }
                }
            }

            config.clangd.setup {
                cmd = { 'clangd' },
                root_markers = { '.clangd', 'compile_commands.json' },
                filetypes = { 'c', 'cpp' }
            }

            config.ts_ls.setup {
                cmd = { 'typescript-language-server', '--stdio' },
                filetypes = { 'typescriptreact', 'typescript', 'javascript' },
                root_markers = { 'package.json' }
            }

            -- config.lexical.setup {
            --     cmd = { 'lexical' },
            --     filetypes = { 'ex', 'exs' }
            -- }

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
    }
}
