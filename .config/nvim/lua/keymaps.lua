-- Set up a shortcut for pasting to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { noremap = true })

-- split line at the current location
vim.keymap.set("n", "|", 'i<cr><ESC>', { noremap = true })


-- Set up a shortcut for pasting from the yank registry. This works even when something was "d" or "x" before hand
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { noremap = true })

-- to test loading
local say_hello = function()
	print("hello world")
end
vim.keymap.set({ "n", "v" }, "<leader>sh", say_hello, { noremap = true })

-- Set neovim current working directory to the directory containing current file
vim.keymap.set({ "n" }, "<leader>cwd", ":cd %:h<cr>", { noremap = true, silent = true })

-- vim-tmux-navigator keybindings
vim.cmd("let g:tmux_navigator_no_mappings=1")
vim.keymap.set({ "n" }, "<c-h>", ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-j>", ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-k>", ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-l>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })
