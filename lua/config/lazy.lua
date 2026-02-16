-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- {
		-- "sainnhe/gruvbox-material",
		-- lazy = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.gruvbox_material_enable_italic = true
		-- 	vim.cmd.colorscheme("gruvbox-material")
		-- end,
		-- },
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			lazy = false,
			build = ":TSUpdate",
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
		},
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				vim.cmd.colorscheme("catppuccin")
			end,
		},
		-- {
		-- 	"rebelot/kanagawa.nvim",
		-- 	config = function()
		-- 		vim.cmd.colorscheme("kanagawa-dragon")
		-- 	end,
		-- },
		{
			"ibhagwan/fzf-lua",
			config = function()
				require("plugin_spec.fzf-lua")
			end,
		},
		{
			"stevearc/conform.nvim",
			config = function()
				require("plugin_spec.conform")
			end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "gruvbox-material" } },
	install = { colorscheme = { "kanagawa-dragon" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
})
