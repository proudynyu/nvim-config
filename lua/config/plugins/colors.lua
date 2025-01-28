return {
    {
        'navarasu/onedark.nvim',
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
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.cmd.colorscheme "onedark"
        end
    },
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        -- config = function() vim.cmd.colorscheme "rose-pine" end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opt = {},
        config = function()
            -- vim.cmd.colorscheme "tokyonight"
        end
    },
}
