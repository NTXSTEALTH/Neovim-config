return {
	{
		"ellisonleao/dotenv.nvim",
		enabled = false,
		lazy = false,
		config = function()
			require("dotenv").setup({
				enable_on_load = true,
				verbose = false,
			})
		end,
	},
}
