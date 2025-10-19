---@diagnostic disable: assign-type-mismatch
return {

	{ "norcalli/nvim-colorizer.lua" },
	{
		"xzbdmw/colorful-menu.nvim",
		config = function()
			-- You don't need to set these options.
			require("colorful-menu").setup({
				ls = {
					lua_ls = {
						-- Maybe you want to dim arguments a bit.
						arguments_hl = "@comment",
					},
					gopls = {
						-- By default, we render variable/function's type in the right most side,
						-- to make them not to crowd together with the original label.

						-- when true:
						-- foo             *Foo
						-- ast         "go/ast"

						-- when false:
						-- foo *Foo
						-- ast "go/ast"
						align_type_to_right = true,
						-- When true, label for field and variable will format like "foo: Foo"
						-- instead of go's original syntax "foo Foo". If align_type_to_right is
						-- true, this option has no effect.
						add_colon_before_type = false,
						-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
						preserve_type_when_truncate = true,
					},
					-- for lsp_config or typescript-tools
					ts_ls = {
						-- false means do not include any extra info,
						-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
						extra_info_hl = "@comment",
					},
					vtsls = {
						-- false means do not include any extra info,
						-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
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
					zls = {
						-- Similar to the same setting of gopls.
						align_type_to_right = true,
					},
					roslyn = {
						extra_info_hl = "@comment",
					},
					dartls = {
						extra_info_hl = "@comment",
					},
					-- The same applies to pyright/pylance
					basedpyright = {
						-- It is usually import path such as "os"
						extra_info_hl = "@comment",
					},
					pylsp = {
						extra_info_hl = "@comment",
						-- Dim the function argument area, which is the main
						-- difference with pyright.
						arguments_hl = "@comment",
					},
					-- If true, try to highlight "not supported" languages.
					fallback = true,
					-- this will be applied to label description for unsupport languages
					fallback_extra_info_hl = "@comment",
				},
				-- If the built-in logic fails to find a suitable highlight group for a label,
				-- this highlight is applied to the label.
				fallback_highlight = "@variable",
				-- If provided, the plugin truncates the final displayed text to
				-- this width (measured in display cells). Any highlights that extend
				-- beyond the truncation point are ignored. When set to a float
				-- between 0 and 1, it'll be treated as percentage of the width of
				-- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
				-- Default 60.
				max_width = 60,
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup({ indent = { highlight = highlight } })
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					separator_style = "padded_slant",
					numbers = "id",
				},
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- lsp = {
			-- 	-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			-- 	override = {
			-- 		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 		["vim.lsp.util.stylize_markdown"] = true,
			-- 		["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			-- 	},
			-- },
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			-- `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"lmantw/themify.nvim",

		lazy = false,
		priority = 999,

		config = {
			--NOTE: All the installed Themes.
			"catppuccin/nvim",
			"folke/tokyonight.nvim",
			"rebelot/kanagawa.nvim",
			"ellisonleao/gruvbox.nvim",
			"rktjmp/lush.nvim",
			"nyoom-engineering/nyoom.nvim",
			"olimorris/onedarkpro.nvim",
			async = true,
			activity = true,
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "helix",
			-- ignore_missing = false,
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				{ "<leader>l", icon = "󰒲" }, -- NOTE: Lazy GUI
				{ "<leader>x", group = "Diagnostics", icon = "" }, -- NOTE: trouble GUI
				{ "<leader>e", icon = "" }, -- NOTE: Neo Tree GUI
				{ "<leader>/", icon = "󱁴" }, -- NOTE: File GREP GUI
				{ "<leader>f", group = "File", icon = "" }, -- NOTE: File GUI
				{ "<leader>fs", icon = "󰑓" }, -- NOTE: Find File GUI
				{ "<leader><leader>", icon = "" }, -- NOTE: Find File GUI
				{ "<leader>fp", icon = "" }, -- NOTE: Find Project GUI
				{ "<leader>fr", icon = "" }, -- NOTE: Find Recent GUI
				{ "<leader>g", group = "Git" }, -- NOTE: Git GUI
				{ "<leader>gl", icon = "󱀄" }, -- NOTE: Git Log GUI
				{ "<leader>gs", icon = "󰩮" }, -- NOTE: Git Status GUI
				{ "<leader>gb", icon = "" }, -- NOTE: Git Branch GUI
				{ "<leader>gS", icon = "" }, -- NOTE: Git Stash GUI
				{ "<leader>s", group = "Utils", icon = "󰙠" }, --NOTE: Utils GUI
				{ "<leader>u", group = "UI" }, -- NOTE: UI Options GUI
				{ "<leader>c", group = "Code" }, -- NOTE: Code Options GUI
				{ "<leader>cr", icon = "" }, -- NOTE: Run Code
				{ "<leader>cf", icon = "" }, -- NOTE: Run File
				{ "m", group = "Mini", icon = "󰘨" }, -- NOTE: Mini Options
				{ "<leader>w", icon = "" }, --NOTE: Save File

				{ "<leader>b", group = "Tabs", icon = "" }, -- NOTE: Tabs
				{ "<leader>bc", icon = "󰛉" }, --NOTE: Close Tab
				{ "<leader>br", icon = "󰦛" }, --NOTE: Restore Tab
				{ "<leader>bb", icon = "" }, --NOTE: Prev Tab
				{ "<leader>bn", icon = "" }, --NOTE: Next Tab
				{ "<leader>bB", icon = "" }, --NOTE: Move Tab Right
				{ "<leader>bN", icon = "" }, --NOTE: Move Tab Left

				{ "<leader>cS", group = "Live Server", icon = "" }, --NOTE: Live Server
				{ "<leader>cSs", icon = "" }, --NOTE: Live Server Start
				{ "<leader>cSS", icon = "" }, --NOTE: Live Server Stop

				{ "<leader>b1", icon = "1" },
				{ "<leader>b2", icon = "2" },
				{ "<leader>b3", icon = "3" },
				{ "<leader>b4", icon = "4" },
				{ "<leader>b5", icon = "5" },
				{ "<leader>b6", icon = "6" },
				{ "<leader>b7", icon = "7" },
				{ "<leader>b8", icon = "8" },
				{ "<leader>b9", icon = "9" },

				{ "<leader>t", group = "Terminal Options", icon = "" }, -- NOTE: Sessions Options

				{ "<leader>a", group = "AI", icon = "" }, -- NOTE: Sessions Options

				{ "<leader>q", group = "Sessions", icon = "" }, -- NOTE: Sessions Options
			})
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},

			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"sphamba/smear-cursor.nvim",

		opts = {
			-- Smear cursor when switching buffers or windows.
			smear_between_buffers = true,

			-- Smear cursor when moving within line or to neighbor lines.
			-- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
			smear_between_neighbor_lines = true,

			-- Draw the smear in buffer space instead of screen space when scrolling
			scroll_buffer_space = true,

			-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
			-- Smears will blend better on all backgrounds.
			legacy_computing_symbols_support = false,

			-- Smear cursor in insert mode.
			-- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
			smear_insert_mode = true,
		},
	},
}
