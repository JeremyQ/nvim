vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("remap")
require("options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- Add Lazy to runtime path
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "plugins" }, {})
