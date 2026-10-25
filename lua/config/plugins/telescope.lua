return {
    {
        "nvim-telescope/telescope.nvim",
        dependecies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        defaults = {
            file_ignore_patterns = {
                "node_modules",
                "package-lock.json"
            }
        },
        config = function()
            local builtin = require('telescope.builtin')

            require("telescope").setup {
                pickers = {
                    find_files = {
                        previewer = false
                    }
                },
                vim.keymap.set('n', '<leader>pf', function()
                    local themes = require('telescope.themes')
                    builtin.find_files(themes.get_ivy({}))
                end),
                vim.keymap.set('n', '<leader>pw', builtin.live_grep, {}),
                vim.keymap.set('n', '<leader>pg', builtin.git_files, {}),
                vim.keymap.set('n', '<leader>ps', function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end),
                vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
            }
        end
    }
}
