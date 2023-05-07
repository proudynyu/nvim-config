function Color(color)
    if color then
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

Color()
