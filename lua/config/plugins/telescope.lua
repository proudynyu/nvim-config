return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependecies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        defaults = {
            file_ignore_patterns = {
                "node_modules"
            }
        },
        config = function()
            local builtin = require('telescope.builtin')

            require("telescope").setup {
                vim.keymap.set('n', '<leader>pf', builtin.find_files, {}),
                vim.keymap.set('n', '<leader>pw', builtin.live_grep, {}),
                vim.keymap.set('n', '<C-p>', builtin.git_files, {}),
                vim.keymap.set('n', '<leader>ps', function()
                    builtin.grep_string({ search = vim.fn.input("Grep > ") })
                end),
                vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
            }
        end
    }
}
