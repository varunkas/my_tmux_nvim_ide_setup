vim.api.nvim_create_autocmd("FileType", {
	pattern = "nextflow",
	callback = function()
		vim.cmd("set shiftwidth=4")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.cmd("set wrap")
		vim.cmd("set linebreak")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tsv" },
	callback = function()
		vim.o.expandtab = false
		vim.o.tabstop = 8
		vim.o.shiftwidth = 8
    vim.o.list = true
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.bedpe", "*.bed" },
	callback = function()
		vim.o.expandtab = false
		vim.o.tabstop = 8
		vim.o.shiftwidth = 8
    vim.o.list = true
	end,
})
