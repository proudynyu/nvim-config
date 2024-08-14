function Color(color)
    if color then
        if color == 'rose-pine' then
            require('rose-pine').setup {
                transparent = true,
                disable_background = true
            }
        end

        if color == "gruvbox-baby" then
            vim.g.gruvbox_baby_transparent_mode = true
            vim.g.gruvbox_baby_background_color = 'dark'
        end

        if color == "gruvbox" then
            vim.o.background = "dark"
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                overrides = {
                    background = { bg = "#181818"}
                }
            })
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

Color("torte")
