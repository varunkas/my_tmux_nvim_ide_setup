-- This file is not currently required in the init.lua file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		print("This is a lua file")
	end,
})
