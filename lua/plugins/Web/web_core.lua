return {
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
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
		config = function()
			require("tailwindcss-colorizer-cmp").setup()
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript" },
		opts = { -- set to setup table
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		ft = { "javascriptreact", "typescriptreact", "typescript", "javascript", "html" },
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
}
