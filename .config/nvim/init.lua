-- Load globally set vim-options
require("options")

-- Load globally set vim keybindings
require("keymaps")
--
-- Load custom autocmds, if any
require("autocmds")

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

-- Install/Load and setup all the plugins for Lazy
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
  install = {
    colorscheme = { "catppuccin" }
  }
})
--


-- load custom capabiliites
require("custom-snippets")

-- load nextflow language server
-- require('lspconfig').nextflow_ls.setup{
--   capabilities = vim.lsp.protocol.make_client_capabilities(),
-- }
