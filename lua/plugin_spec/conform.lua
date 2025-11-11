require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format", "ruff_organize_imports" },
	},
	-- Set up format-on-save
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
})
