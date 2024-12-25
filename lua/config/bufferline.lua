-- trying without the bufferline first
-- use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
vim.opt.termguicolors = true

vim.keymap.set("n", "<tab>", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<S-tab>", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<leader>x", vim.cmd.bd)

require('bufferline').setup{}
