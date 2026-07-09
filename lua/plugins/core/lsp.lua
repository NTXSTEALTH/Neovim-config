--- |=== Plugins ===|
--- Mason
--- lsp-config
--- Mason lsp-config
--- Conform
--- |===============|

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	underline = true,
	severity_sort = true,
})

return {

	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
			event = "VeryLazy",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		opts = {
			auto_update = true,
			ensure_installed = {
				--- Lua
				"lua_ls",
				"stylua",

				--- Python
				"ruff",
				--- JS / TS
				"ts_ls",
				"biome",
				"emmet-ls",
				"cssls",
				"tailwindcss",

				--- CSS / HTML/ YAML / TOML
				"prettierd",

				--- Rust
				"rust_analyzer",

				--- C
				"clangd",
			},
		},
	},
	{

		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},

			formatters = {
				my_formatter = {
					command = "nufmt",
					args = { "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				javascript = { "biome" },
				javascriptreact = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				html = { "biome" },
				json = { "prettierd" },
				css = { "prettierd" },
				toml = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				c = { "clang-format" },
				rust = { "rustfmt" },
				nu = { "nufmt" },
			},
		},
	},
}
