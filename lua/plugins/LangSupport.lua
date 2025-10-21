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
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Required dependency
		config = function()
			require("tailwind-tools").setup({
				-- Optional: Configure the inline color hints (the core feature you want)
				color_hints = {
					enabled = true,
				},
				-- If you already configured the tailwindcss LSP, set this to true
				-- to prevent the plugin from trying to set it up again.
				server = {
					override = false,
				},
			})
		end,
	},
}
