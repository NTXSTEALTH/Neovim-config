---@diagnostic disable: assign-type-mismatchu
return {

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
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
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
						refresh_time = 16, -- ~60fps
						events = {
							"WinEnter",
							"BufEnter",
							"BufWritePost",
							"SessionLoadPost",
							"FileChangedShellPost",
							"VimResized",
							"Filetype",
							"CursorMoved",
							"CursorMovedI",
							"ModeChanged",
						},
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename" },
					lualine_c = {
						"branch",
						"diff",
						"diagnostics",
						{
							function()
								local reg = vim.fn.reg_recording()
								return " recording to " .. reg
							end,
							color = "DiagnosticError",
							cond = function()
								return vim.fn.reg_recording() ~= ""
							end,
						},
					},
					lualine_x = { { "searchcount" }, { "progress" } },
					lualine_y = { "lsp_status" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			-- 1. Bufferline Setup
			require("bufferline").setup({
				options = {
					-- separator_style = "slope",
				},
			})

			-- 2. Add the snippet for transparent.nvim
			-- This ensures all bufferline highlights are made transparent
			require("transparent").clear_prefix("BufferLine")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				-- Notification messages have their level and other properties set.
				-- event is always "notify" and kind can be any log level as a string
				-- The default routes will forward notifications to nvim-notify
				-- Benefit of using Noice for this is the routing and consistent history view
				enabled = true,
				view = "notify",
			},
			presets = {
				bottom_search = false, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			-- `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
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
			"rose-pine/neovim",
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

				{ "<leader>t", icon = "" }, -- NOTE: Terminal Options

				{ "<leader>a", group = "AI", icon = "" }, -- NOTE: AI Options

				{ "<leader>m", group = "Mini / Bookmark", icon = "" }, -- NOTE: Mini / Bookmarks
				{ "<leader>mc", icon = "󰃢" }, -- NOTE : Clean all bookmarks
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
	{
		"xiyaowong/transparent.nvim",
		lazy = false, -- THIS IS CRITICAL
		priority = 1000,
		config = function()
			-- Optional, you don't have to run setup.
			require("transparent").clear_prefix("BufferLine")
			require("transparent").setup({
				-- table: default groups
				groups = {
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				-- table: additional groups that should be cleared
				extra_groups = { "NormalFloat", "FloatBorder", "FloatTitle" },
				-- table: groups you don't want to clear
				exclude_groups = {},
				-- function: code to be executed after highlight groups are cleared
				-- Also the user event "TransparentClear" will be triggered
				on_clear = function() end,
			})
		end,
	},
	{
		"declancm/cinnamon.nvim",
		version = "*", -- use latest release
		opts = {
			-- change default options here
		},
	},
}
