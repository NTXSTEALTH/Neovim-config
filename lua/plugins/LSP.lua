-- lua/config/lsp.lualsp.lua
local formatters = {
	"prettierd",
	"stylua",
	"ruff",
}

local servers = {
	"basedpyright",

	"clangd",

	"cssls",
	"emmet_ls",
	"eslint",
	"svlangserver",
	"tailwindcss",
	"ts_ls",

	"lua_ls",
	"stylua",

	"ruff", -- Assuming you want the Ruff LSP (was "ruff")
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
	virtual_text = true,
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
				lsp_fallback = true, -- Crucial: if conform can't format, it tries LSP formatters
			},
		},
	},

	{ "mason-org/mason.nvim", opts = {

		ensure_installed = servers,
	} },
	-- -- 3. nvim-lspconfig (LSP Configuration)
	--
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = {
	-- 		-- CRUCIAL: Provides the enhanced LSP capabilities needed by completion plugins like blink.cmp
	-- 		{ "hrsh7th/cmp-nvim-lsp" },
	-- 	},
	-- 	config = function()
	-- 		-- Get the enhanced capabilities object
	-- 		-- 	local lspconfig = require("lspconfig")
	-- 		-- 	local mason_lspconfig = require("mason-lspconfig")
	-- 		-- 	})
	-- 	end,
	-- },
	-- {
	-- 	"mason-org/mason-lspconfig.nvim",
	-- 	dependencies = {
	-- 		{ "mason-org/mason.nvim", opts = {} },
	-- 		{ "neovim/nvim-lspconfig", opts = {} },
	-- 		{ "hrsh7th/cmp-nvim-lsp", opts = {} },
	-- 		{ "L3MON4D3/LuaSnip" },
	-- 		{
	-- 			"hrsh7th/nvim-cmp",
	--
	-- 			config = function()
	-- 				require("cmp").setup({
	-- 					snippet = {
	-- 						expand = function(args)
	-- 							require("luasnip").lsp_expand(args.body)
	-- 						end,
	-- 					},
	--
	-- 					sources = {
	-- 						{ name = "luasnip" },
	-- 						-- more sources
	-- 					},
	-- 				})
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	--
	-- 		local lspconfig = require("lspconfig")
	--
	-- 		-- 2. Setup mason-lspconfig to install servers and apply global config
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = servers, -- Use the list defined at the top
	--
	-- 			-- Global Handler: Called for every server installed by Mason
	-- 			handlers = {
	-- 				-- Default handler for all servers
	-- 				function(server_name)
	-- 					-- Use the lspconfig table and the correctly named handler argument
	-- 					lspconfig[server_name].setup({
	-- 						capabilities = capabilities,
	-- 						on_attach = function(client, bufnr)
	-- 							-- This is where you put your keymaps for LSP actions
	-- 							-- e.g. vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
	-- 						end,
	-- 						-- Add any general server settings here (e.g., rust_analyzer)
	-- 					})
	-- 				end,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
