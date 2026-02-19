--- NOTE: This File houses all the LSP and Formatter Plugins and their configurations.for

--- Conform          : Formatter
--- Mason            : LSP Manager
--- Blink            : CMP
--- Colorful_menu    : CMP customization.
--- Nvin_lint        :Linting.

vim.g.colorful_menu = true
vim.lsp.inlay_hint.enable(true)

--- NOTE: Enabling LSP's
vim.lsp.enable({

	--- LUA
	"lua_ls",

	--- Python
	"basedpyright",

	--- Web / JS / TS
	"ts_ls",
	-- "vtsls",
	"emmet-ls",
	"cssls",
	"tailwindcss",

	--- C / C++
	"clangd",

	--- Spell CHecker
	"harper-ls",
})

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
	underline = true,
	severity_sort = true,
})

return {

	{
		"stevearc/conform.nvim",
		event = "BufReadPre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				python = { "ruff_format" },

				javascript = { "biome" },
				javascriptreact = { "biome" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				json = { "prettierd" },
				css = { "prettierd" },
				scss = { "biome" },
				html = { "biome" },
				yaml = { "biome" },

				markdown = { "prettierd" },
				assembly = { "asmfmt" },

				-- c = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters = {},
		},
	},

	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"basedpyright",
				"ruff",

				"clangd",

				"ts_ls",
				"cssls",
				"emmet_ls",
				"eslint",
				"tailwindcss",

				"lua_ls",
				"stylua",

				"rust_analyzer",
			},
		},
	},

	{
		"saghen/blink.cmp",
		event = "BufReadPre",
		dependencies = { { "rafamadriz/friendly-snippets", event = "BufReadPre" } },
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config

		opts = {
			keymap = { preset = "super-tab" },

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,
				},

				menu = {
					auto_show = true,

					draw = {
						columns = {
							{ "label", "label_description", gap = 10 },
							{ "kind_icon", "kind", gap = 20 },
						},
					},
				},
			},

			sources = {
				default = { "lazydev", "snippets", "lsp", "path", "buffer" },

				providers = {
					lazydev = {
						name = "lazydev",
						module = "lazydev.integrations.blink",
					},
				},
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"xzbdmw/colorful-menu.nvim",
		event = "BufReadPre",
		enabled = vim.g.colorful_menu,
		config = function()
			-- You don't need to set these options.
			require("colorful-menu").setup({
				ls = {
					lua_ls = {
						arguments_hl = "@comment",
					},
					ts_ls = {
						extra_info_hl = "@comment",
					},
					["rust-analyzer"] = {
						-- Such as (as Iterator), (use std::io).
						extra_info_hl = "@comment",
						-- Similar to the same setting of gopls.
						align_type_to_right = true,
						-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
						preserve_type_when_truncate = true,
					},
					clangd = {
						-- Such as "From <stdio.h>".
						extra_info_hl = "@comment",
						-- Similar to the same setting of gopls.
						align_type_to_right = true,
						-- the hl group of leading dot of "•std::filesystem::permissions(..)"
						import_dot_hl = "@comment",
						-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
						preserve_type_when_truncate = true,
					},
					-- The same applies to pyright/pylance
					basedpyright = {
						-- It is usually import path such as "os"
						extra_info_hl = "@comment",
					},
					-- If true, try to highlight "not supported" languages.
					fallback = true,
					-- this will be applied to label description for unsupport languages
					fallback_extra_info_hl = "@comment",
				},
				fallback_highlight = "@variable",
				max_width = 60,
			})
		end,
	},

	--- NOTE: LINTING
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- 🔧 Map filetypes to linters
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "ruff" },
				-- lua = { "luacheck" },
				-- sh = { "shellcheck" },
			}

			-- 🚀 Run linting automatically
			local augroup = vim.api.nvim_create_augroup("Linting", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
