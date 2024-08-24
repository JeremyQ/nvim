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
		require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright" }, })
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		})
		require("lspconfig").pyright.setup({
			on_attach = on_attach,
			settings = {
				pyright = {
					autoImportCompletion = true,
				},
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = 'openFilesOnly',
						useLibraryCodeForTypes = true,
						typeCheckingMode = 'off'
					}
				}
			}
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				local builtin = require "telescope.builtin"
				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
				vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
				vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
			end
		})
	end,
}
