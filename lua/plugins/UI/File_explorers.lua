--- |=== Plugins ===|
--- OIL nvim
--- telescope
--- Dropbar
--- |===============|

return {
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	---@module 'oil'
	-- 	---@type oil.SetupOpts
	-- 	opts = {
	-- 		default_file_explorer = true,
	-- 		float = {
	-- 			border = "rounded",
	-- 		},
	--
	-- 		view_options = {
	-- 			show_hidden = true,
	-- 		},
	-- 		delete_to_trash = true,
	-- 	},
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	lazy = false,
	-- },
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
	{
		---@type LazySpec
		"mikavilpas/yazi.nvim",
		version = "*", -- use the latest stable version
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
		},
		-- keys = {
		-- 	-- 👇 in this section, choose your own keymappings!
		-- 	{
		-- 		"<leader>-",
		-- 		mode = { "n", "v" },
		-- 		"<cmd>Yazi<cr>",
		-- 		desc = "Open yazi at the current file",
		-- 	},
		-- 	{
		-- 		-- Open in the current working directory
		-- 		"<leader>cw",
		-- 		"<cmd>Yazi cwd<cr>",
		-- 		desc = "Open the file manager in nvim's working directory",
		-- 	},
		-- 	{
		-- 		"<c-up>",
		-- 		"<cmd>Yazi toggle<cr>",
		-- 		desc = "Resume the last yazi session",
		-- 	},
		-- },
		---@type YaziConfig | {}
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
		-- 👇 if you use `open_for_directories=true`, this is recommended
		init = function()
			-- mark netrw as loaded so it's not loaded at all.
			--
			-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
