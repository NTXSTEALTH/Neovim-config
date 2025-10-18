-- lua/config/lsp.lualsp.lua

local servers = {
	"basedpyright",
	"ruff",

	"clangd",

	"ts_ls",
	"cssls",
	"emmet_ls",
	"eslint",
	"svlangserver",
	"tailwindcss",

	"lua_ls",
	"stylua",

	"rust_analyzer",
}

-- capabilities.lua or near your LSP setup
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- If using nvim-cmp, enhance completion support
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.enable({
	"lua_ls", --NOTE: Lua Lsp
	"stylua", --NOTE: Lua Formatter

	"ruff", --NOTE: Python Linter and Formatter
	"basedpyright", --NOTE: Python Lsp

	"ts_ls", --NOTE:typescript Lsp
	"emmet-ls", --NOTE: Emmet Lsp
	"cssls", --NOTE: CSS Lsp
	"eslint", --NOTE: Web tech linter and formatter
	"tailwindcss", --NOTE: tailwindcss Lsp

	"clangd", --NOTE: C Lsp
})

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	underline = true,

	severity_sort = true,
})
return {

	-- 2. Conform (Formatter)
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				python = { "ruff_format" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				json = { "prettierd" },
				css = { "prettierd" },
				scss = { "prettierd" },
				html = { "prettierd" },
				yaml = { "prettierd" },

				markdown = { "prettierd" },

				c = { "clangd" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true, --Crucial: if conform can't format, it tries LSP formatters
			},
		},
	},

	{ "mason-org/mason.nvim", opts = {
		ensure_installed = servers,
	} },
}
