vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.keymap.set('v', 'p', '"_dP')
-- vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

-- open explorer view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- navigations
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- copy to system
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- remove command
vim.keymap.set("n", "Q", "<nop>")

-- split file
vim.keymap.set("n", "<C-y>", vim.cmd.vsplit)

-- change vertical to horizontal split
vim.keymap.set("n", "<leader>H", "<C-w>t<C-w>H")

-- open split terminal
vim.api.nvim_set_keymap("t", "<C-ESC>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<leader>ts", ":split +terminal<enter>")

-- change word globaly
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left>]])

-- vim.g.clipboard="clip.exe"
-- set clipboard=unnamedplus
-- add copy to system (for WSL for now)
-- if package.config.sub(1, 1) == '\\\\' then
vim.g.clipboard = {
    name = 'wsl clipboard',
    copy =  { ["+"] = { "clip.exe" },   ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true
}
