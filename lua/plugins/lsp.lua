return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		{
			-- Set lualine as statusline
			"nvim-lualine/lualine.nvim",
			-- See `:help lualine.txt`
			opts = {
				options = {
					icons_enabled = false,
					-- theme = "tokyonight-night",
					theme = "tokyodark",
					component_separators = "|",
					section_separators = "",
				},
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
	},
	config = function()
		require("_lsp")
	end,
}
