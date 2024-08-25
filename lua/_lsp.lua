local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end
	local builtin = require "telescope.builtin"

	nmap("K", vim.lsp.buf.hover, "Hover")
	nmap("gT", vim.lsp.buf.type_definition, "Goto Type")
	nmap("gd", builtin.lsp_definitions, "Goto Definition")
	nmap("gi", builtin.lsp_implementations, "Goto Implementation")
	nmap("gr", builtin.lsp_references, "Goto References")
	nmap("gn", vim.diagnostic.goto_next, "Goto Next Diagnostic")
	nmap("gp", vim.diagnostic.goto_prev, "Goto Previous Diagnostic")
	nmap("<space>r", vim.lsp.buf.rename, "Rename")
	nmap("<space>ca", vim.lsp.buf.code_action, "Code Action")
end

local servers = {
	pyright = {
		autoImportCompletion = true,
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'openFilesOnly',
				useLibraryCodeForTypes = true,
				typeCheckingMode = 'off'
			}
		},
	},
	lua_ls = {
		Lua = {
			diagnostics = { disable = { 'missing-fields' } },
		}
	}
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- allow lsp to autocomplete lua values
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
	end
})

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}
