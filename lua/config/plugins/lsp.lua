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
                filetypes = { 'c', 'cpp' }
            }
        end
    }
}
