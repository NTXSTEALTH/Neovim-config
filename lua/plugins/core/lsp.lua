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
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
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
						"emmet-ls",
						"cssls",
						"tailwindcss",

						--- JSON / CSS / HTML/ YAML / TOML
						"prettierd",

						--- Rust
						"rust_analyzer",

						--- C
						"clangd",
					},
				},
			},
		},
	},
	{

		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 5000,
				lsp_format = "fallback",
			},
			lua = { "stylua" },
			python = { "ruff_format" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "biome" },
			json = { "prettierd" },
			css = { "prettierd" },
			toml = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			c = { "clang-format" },
			rust = { "rustfmt" },
		},
	},
}
