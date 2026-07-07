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

		require("mini.move").setup({
			mappings = {
				left = "<C-h>",
				right = "<C-l>",
				down = "<C-j>",
				up = "<C-k>",

				line_left = "<C-h>",
				line_right = "<C-l>",
				line_down = "<C-j>",
				line_up = "<C-k>",
			},

			options = {
				reindent_linewise = true,
			},
		})

		require("mini.comment").setup({})
		require("mini.diff").setup({})
		require("mini.align").setup({})
	end,
}
