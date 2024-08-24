return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local configs = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line: missing-fields
			configs.setup({
				ensure_installed = { "c", "lua", "python", "vimdoc", "vim", "bash", "query" },
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = { enable = true, additional_vim_regex_highlighting = true, },
				diagnostics = { disable = { 'missing-fields' } },
			})
		end
	},
}
