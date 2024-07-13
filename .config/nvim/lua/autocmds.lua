vim.api.nvim_create_autocmd("FileType", {
	pattern = "nextflow",
	callback = function()
		vim.cmd("set shiftwidth=2")
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
  desc = "Tab separate for bedfiles",
	pattern = { "*.bedpe", "*.bed" },
	callback = function()
		vim.o.expandtab = false
		vim.o.tabstop = 8
		vim.o.shiftwidth = 8
    vim.o.list = true
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
