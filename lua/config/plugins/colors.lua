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
        'rose-pine/neovim',
        as = 'rose-pine',
        lazy = false,
        -- config = function() vim.cmd.colorscheme "rose-pine" end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1,
        opt = {},
        config = function()
            -- vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1,
    },
    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1, -- make sure to load this before all the other start plugins
        -- config = function()
            --   vim.cmd [[ colorscheme NeoSolarized ]]
            -- end
        },
        { "EdenEast/nightfox.nvim", lazy = false, },
        {
            "eldritch-theme/eldritch.nvim",
            lazy = false,
            priority = 1,
            opts = {},
            -- config = function()
            --     vim.cmd.colorscheme "eldritch"
            -- end
        },
        {
            "zootedb0t/citruszest.nvim",
            lazy = false,
            priority = 1,
        },
        {
            "blazkowolf/gruber-darker.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd.colorscheme "gruber-darker"
            end
        }
}
