return {
	"echasnovski/mini.nvim",
	event = { "BufReadPre", "BufEnter" },
	version = false, -- use latest dev version
	config = function()
		require("mini.pairs").setup({})
		require("mini.icons").setup({
			style = "glyph",
			default = {},
			directory = {},
			extension = {},
			file = {},
			filetype = {},
			lsp = {},
			os = {},
			use_file_extension = function(ext, file)
				return true
			end,
		})
		require("mini.surround").setup({
			mappings = {
				add = "msa",
				delete = "msd",
				replace = "msr",
				find = "msf",
				find_left = "msF",
				highlight = "msh",
				update_n_lines = "msn",
			},
		})
		require("mini.ai").setup({
			n_lines = 500,
		})
		-- require("mini.move").setup({
		-- 	mappings = {
		-- 		left = "<R-A-h",
		-- 		right = "<leader>l",
		-- 		down = "<R-A-k",
		-- 		up = "<leader>k",
		--
		-- 		line_left = "<R-A-h>",
		-- 		line_right = "<leader>l",
		-- 		line_down = "<leader>j",
		-- 		line_up = "<leader>k",
		-- 	},
		--
		-- 	options = {
		-- 		reindent_linewise = true,
		-- 	},
		-- })

		require("mini.comment").setup({})
		require("mini.diff").setup({})
		require("mini.align").setup({})
	end,
}
