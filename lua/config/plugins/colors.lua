return {
    {
        'navarasu/onedark.nvim',
        config = function()
            if vim.g.colors_name == "onedark" then
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end
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
        end
    },
    { 'rose-pine/neovim', as = 'rose-pine' },
}
