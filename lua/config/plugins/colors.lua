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
        opt = { },
        config = function()
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            require("tokyonight").setup {
                transparent = true
            }
            -- vim.cmd.colorscheme "tokyonight"
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("solarized-osaka").setup {
                transparent = true,
                terminal_colors = true,
                comments = { italic = true }
            }

            vim.cmd.colorscheme "solarized-osaka"
        end
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false
    },
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1,
        opts = {},
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
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            -- require("gruvbox").setup {
            --     transparent_mode = true,
            -- }
            -- vim.cmd.colorscheme "gruvbox"
        end
    },
    {
        'Mofiqul/dracula.nvim'
    }
}
