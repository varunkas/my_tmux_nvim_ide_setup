-- Set up a shortcut for pasting to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"*y', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>Y", '"*Y', { noremap = false })

-- Set up a shortcut for pasting from the yank registry. This works even when something was "d" or "x" before hand
vim.keymap.set({ "n", "v" }, "<leader>p", '"0p', { noremap = true })

-- split line at the current location
vim.keymap.set("n", "|", "i<cr><ESC>", { noremap = true })

-- split line after the next desired character
vim.keymap.set("n", "<leader>s", function()
  local char = vim.fn.getcharstr(0)
  if char == "" then
    print("Splitting aborted")
  else
    local cmd_to_exec = 'exec "normal f' .. char .. 'a\\<CR>\\<ESC>l"'
    vim.cmd(cmd_to_exec)
  end
end, { noremap = true, desc = "[S]plit line after any character" })

-- turn off the highlighting upon pressing Escape
vim.keymap.set("n", "<ESC>", ":nohlsearch<CR><ESC>", { noremap = false, silent = true })
-- Set neovim current working directory to the directory containing current file
vim.keymap.set({ "n" }, "<leader>cwd", ":cd %:h<cr>", { noremap = true, silent = true })

-- Shortcut for writing the file
vim.keymap.set({ "i" }, "jj", "<c-o>:w<cr>", { noremap = true, silent = false })

-- vim-tmux-navigator keybindings
vim.cmd("let g:tmux_navigator_no_mappings=1")
vim.keymap.set({ "n" }, "<c-h>", ":TmuxNavigateLeft<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-j>", ":TmuxNavigateDown<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-k>", ":TmuxNavigateUp<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<c-l>", ":TmuxNavigateRight<cr>", { noremap = true, silent = true })
