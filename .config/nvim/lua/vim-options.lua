-- Global settings
--
-- space as leader
vim.g.mapleader = " "

-- Indenting
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Set highlight on search
vim.o.hlsearch = false
--
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- set no line wrap by default
vim.o.wrap = false

-- Mouse active
vim.o.mouse = "a"

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber=true

-- Folding options
--vim.opt.foldopen = "hor,search"
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--vim.opt.foldcolumn = "1"
--vim.opt.foldlevel = 3

-- Add cursorline
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,screenline"

-- Keep a few lines at the bottom so the cursor never reaches the bottommost line
vim.opt.scrolloff = 5
