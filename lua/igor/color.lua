function Color(color)
    if color then
        if color == 'rose-pine' then
            require('rose-pine').setup {
                transparent = true,
                disable_background = true
            }
        end

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.cmd.colorscheme(color)

    else
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

        require('onedark').load()
    end
end

Color('rose-pine')
