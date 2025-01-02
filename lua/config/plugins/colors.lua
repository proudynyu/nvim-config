return {
    {
        'navarasu/onedark.nvim',
        config = function()
            vim.cmd.colorscheme "onedark"
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
            if vim.g.colors_name == "onedark" then
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end
        end
    },
<<<<<<< HEAD
    { 'rose-pine/neovim', as = 'rose-pine' },
    { 
        "folke/tokyonight.nvim",
        config = function() vim.cmd.colorscheme "tokyonight" end,
=======
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        -- config = function() vim.cmd.colorscheme "rose-pine" end,
    },
    {
        "folke/tokyonight.nvim",
>>>>>>> a6e8e45 (feat: adding mason)
        lazy = false,
        priority = 1000,
        opt = {},
    },
}
