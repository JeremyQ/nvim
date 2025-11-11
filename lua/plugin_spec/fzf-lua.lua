require("fzf-lua").setup({
	"fzf-native",
	defaults = {
		file_icons = "mini",
	},
	winopts = {
		border = "rounded",
		height = 0.7,
		row = 0.5,
	},
	files = { hidden = false },
	update_check = {
		enabled = false,
	},
})

vim.keymap.set("n", "<leader>sb", "<cmd>FzfLua buffers<cr>", { desc = "Fuzzy search opened buffers" })
vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "Fuzzy grep files" })
vim.keymap.set("n", "<leader>sh", "<cmd>FzfLua helptags<cr>", { desc = "Fuzzy grep tags in help files" })
vim.keymap.set("n", "<leader>st", "<cmd>FzfLua btags<cr>", { desc = "Fuzzy search buffer tags" })
vim.keymap.set("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Fuzzy find current word" })
