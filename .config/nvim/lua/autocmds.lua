-- The filetype specific settings are added to after/ftplugin/ft.lua
-- Here we make sure *.bedpe and *.bed files are detected to be the correct filetype
vim.api.nvim_create_autocmd({ "BufEnter", "BufNew" }, {
	desc = "Tab separate for bedfiles",
	pattern = { "*.bedpe", "*.bed" },
	callback = function()
		vim.cmd("set filetype=bed")
	end,
})
