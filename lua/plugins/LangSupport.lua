return {
	{
		"ThePrimeagen/refactoring.nvim",
		event = "VeryLazy",
		config = function()
			require("refactoring").setup({})
		end,
	},
	{
		"folke/lazydev.nvim",
		event = "VeryLazy",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
        event = "VeryLazy",
		opts = {},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "VeryLazy",
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
}
