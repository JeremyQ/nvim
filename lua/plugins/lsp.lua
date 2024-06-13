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
					theme = "tokyonight",
					component_separators = "|",
					section_separators = "",
				},
			},
		},
	},
	config = function()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		})
	end,
}
