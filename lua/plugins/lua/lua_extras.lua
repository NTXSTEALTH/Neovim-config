return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		event = "BufReadPre",

		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
