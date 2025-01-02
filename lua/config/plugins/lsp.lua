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
            local config = require('lspconfig')

            config.lua_ls.setup {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' }
            }

            config.clangd.setup {
                cmd = { 'clangd' },
                root_markers = { '.clangd', 'compile_commands.json' },
                filetypes = { 'c', 'cpp' }
            }

            -- config.lexical.setup {
            --     cmd = { 'lexical' },
            --     filetypes = { 'ex', 'exs' }
            -- }
        end
    }
}
