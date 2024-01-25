-- Set up a shortcut for pasting to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { noremap = true })

-- Set up a shortcut for pasting from the yank registry. This works even when something was "d" or "x" before hand
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { noremap = true })

-- to test loading
local say_hello = function()
	print("hello world")
end
vim.keymap.set({ "n", "v" }, "<leader>sh", say_hello, { noremap = true })

-- vim-tmux-navigator keybindings
vim.cmd("let g:tmux_navigator_no_mappings=1")
vim.keymap.set({ "n" }, "<c-h>", ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-j>", ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-k>", ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-l>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })
