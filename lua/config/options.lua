-- Set numbers and relative numbering
vim.o.number = true
vim.o.relativenumber = true

-- Set highlight current line
vim.o.cursorline = true

-- Wrap and scrolloff
vim.o.wrap = false
vim.o.scrolloff = 10

-- Set tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Visual improvements
vim.o.termguicolors = true
vim.o.winborder = "rounded"

-- Save undo history
vim.opt.undofile = true

-- Set virtual edit
vim.o.virtualedit = "block"

-- Use clipboard
vim.o.clipboard = "unnamedplus"

-- Enable mouse mode
vim.o.mouse = "a"
