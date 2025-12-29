return {
	{
		"linux-cultist/venv-selector.nvim",
		event = "BufReadPre",
		dependencies = {
			{ "neovim/nvim-lspconfig", event = "BufReadPre" },
		},
		ft = "python", -- Load when opening Python files
		keys = {
			{ "<leader>lpv", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" }, -- Open picker on keymap
		},
		opts = { -- this can be an empty lua table - just showing below for clarity.
			search = {}, -- if you add your own searches, they go here.
			options = {}, -- if you add plugin options, they go here.
		},
	},
}
