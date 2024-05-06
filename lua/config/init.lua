vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.remap")
require("config.telescope")
require("config.treesitter")
require("config.harpoon")
require("config.undotree")
require("config.vim-fugitive")
require("config.lsp")
require("config.set")
require("config.color")
require("config.bufferline")
require("config.neo-tree")
require("config.which-key")
require("config.feline")

require("Comment").setup()
require("colorizer").setup()

