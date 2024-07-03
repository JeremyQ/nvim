require("telescope").setup({
	extensions = {
		wrap_results = true,
		fzf = {},
	},
	["ui-select"] = {
		require("telescope.themes").get_dropdown({ winblend = 10, previewer = false }),
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<space>sf", builtin.find_files)
vim.keymap.set("n", "<space>sh", builtin.help_tags)
vim.keymap.set("n", "<space>sg", builtin.live_grep)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<space>sw", builtin.grep_string)
