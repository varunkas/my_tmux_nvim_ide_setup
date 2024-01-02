-- Set up a shortcut for pasting to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { noremap = true })

-- Set up a shortcut for pasting from the yank registry. This works even when something was "d" or "x" before hand
vim.keymap.set("n", "<leader>p", '"0p', { noremap = true })
vim.keymap.set("v", "<leader>p", '"0p', { noremap = true })

