vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set("i", "<C-Space>", function()
				vim.lsp.completion.get()
			end)
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		end
	end,
})

-- Diagnostics
vim.diagnostic.config({
	-- virtual_lines = {
	-- 	-- Only show virtual line diagnostics for the current cursor line
	-- 	current_line = true,
	-- },
})

vim.lsp.enable({ "lua_ls", "basedpyright", "ruff" })

-- allow lsp to autocomplete lua values
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
	end,
})
