return {
	"akinsho/toggleterm.nvim",
	enabled = vim.g.toggle_term,
	cmd = "ToggleTerm",
	event = "VeryLazy",
	opts = {
		persist_size = true,
		shell = "nu",
		vim.api.nvim_set_keymap(
			"t",
			"<Esc>",
			"<C-\\><C-N>",
			{ noremap = true, silent = true, desc = "Exit terminal mode" }
		),
		vim.api.nvim_set_keymap(
			"t",
			"<A-j>",
			"<C-\\><C-N>",
			{ noremap = true, silent = true, desc = "Exit terminal mode" }
		),
		direction = "right",
	},

	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
