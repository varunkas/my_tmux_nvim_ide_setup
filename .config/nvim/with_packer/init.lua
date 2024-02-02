-- ******* Tell Lua to load the file ~/.config/nvim/lua/plugins.lua *******
require('plugins') 

-- ******* nvim editor settings ******* 
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber=true
vim.opt.autoindent = true
vim.opt.shiftwidth = 4 

-- ******* change default color ******
vim.cmd("colorscheme slate")

-- ******* settings for Netrw to access scp ******
vim.cmd("set nocp")
vim.cmd("filetype plugin on")

-- ******* Change the default to exit insert model when in terminal ******
vim.api.nvim_set_keymap(
    "t",
    "<Esc>",
    "<C-\\><C-n>",
    { noremap = true }
)

-- ******* set global shortcut prefix (also called leader) *******
vim.g.mapleader = ","


