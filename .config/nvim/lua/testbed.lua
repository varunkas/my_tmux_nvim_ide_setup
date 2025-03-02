vim.keymap.set({ "v" }, "gst", function()
	local a_orig = vim.fn.getreg("a")
	vim.cmd('silent! normal! "ay')
	local text = vim.fn.getreg("a")
	vim.fn.setreg("a", a_orig)
  local discard
  local newtext
  newtext, discard = string.gsub(text,"\n","\" Enter ")
  -- print(':! tmux send-keys -t 2 ' .. newtext)
  local tosend = ":! tmux send-keys -t 2 \"" .. newtext
  vim.cmd(tosend)
end, { silent = true })
