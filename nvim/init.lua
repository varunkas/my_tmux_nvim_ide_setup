-- Install plugin manager (lazy.vim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load globally set vim-options
require("vim-options")
-- Load globally set vim keybindings
require("keybindings")
-- Load custom autocmds, if any
-- require("autocmds")
-- Install/Load and setup all the plugins for Lazy
require("lazy").setup("plugins")

-- Do not show the neotree when opening by default. NOT WORKING!!!
require("neo-tree.command").execute({ action = "close" })
