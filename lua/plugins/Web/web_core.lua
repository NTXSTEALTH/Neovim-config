return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		-- event = "BufReadPre",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		opts = {
			debounce = 150,
			include_languages = {
				html = "html",
				javascript = "javascript",
				typescript = "typescript",
			},
			experimental = {
				classRegex = { 'class="([^"]*)"', 'className="([^"]*)"' },
			},
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		-- event = "BufReadPre",
		config = function()
			require("tailwindcss-colorizer-cmp").setup()
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		event = "BufReadPre",
		opts = { -- set to setup table
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		-- event = "BufReadPre",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
}
