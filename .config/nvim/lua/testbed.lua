local buf_vtext = function()
  local a_orig = vim.fn.getreg("a")
  local mode = vim.fn.mode()
  local text
  if mode ~= "v" and mode ~= "V" then
    print("No text selected!")
  else
    vim.cmd([[silent! normal! "aygv]])
    text = vim.fn.getreg("a")
    vim.fn.setreg("a", a_orig)
  end
  return text
end

local print_selected_text = function()
  text = buf_vtext()
  print(text)
end

return print_selected_text
