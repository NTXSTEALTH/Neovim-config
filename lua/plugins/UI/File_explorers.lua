--- |=== Plugins ===|
--- OIL nvim
--- telescope
--- Dropbar
--- |===============|

return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = true,
			float = {
				border = "rounded",
			},

			view_options = {
				show_hidden = true,
			},
			delete_to_trash = true,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
		},
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			event = "VeryLazy",
			build = "make",
		},
	},
}
