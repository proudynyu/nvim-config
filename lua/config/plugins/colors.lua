return {
    {
        'navarasu/onedark.nvim',
        lazy = false,
        config = function()
            require("onedark").setup {
                style = "deep",
                transparent = true,
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                colors = {},
                highlights = {},

                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true,
                },

            }
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- vim.cmd.colorscheme "onedark"
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1,
        opt = { },
        config = function()
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- require("tokyonight").setup {
            --     transparent = true
            -- }
            -- vim.cmd.colorscheme "tokyonight-storm"
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            -- require("gruvbox").setup {
            --     transparent_mode = true,
            -- }
            vim.cmd.colorscheme "gruvbox"
        end
    }
}
