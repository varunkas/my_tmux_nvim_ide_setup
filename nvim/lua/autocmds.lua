-- This file is not currently required in the init.lua file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nextflow",
  callback = function()
    vim.cmd("set shiftwidth=4")
  end,
})
