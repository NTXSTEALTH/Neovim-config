--- NOTE: Contains all the core UI plugins

--- Indent-blankline : highlight indented lines.
--- Lualine          : Status line plugin.
--- Themify          : Theme manager.
--- WhichKey         : Displays a popup with possible key bindings of the current mode.
--- Smear-cursor     : Smooth cursor movement.
--- Transparent      : Transparent background.
--- Cinnamon         : Smooth scrolling.
--- Noice            : Better UI.
--- split-jump       : Jump between split panes.

return {

	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		event = "BufReadPre",
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
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					duration = 200,
					delay = 100,
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",

		dependencies = {
			{
				"nvim-tree/nvim-web-devicons",
				event = "VeryLazy",
			},
		},
		config = function()
			local auto_theme_custom = require("lualine.themes.auto")
			auto_theme_custom.normal.c.bg = "none"
			require("lualine").setup({

				options = {
					icons_enabled = true,
					theme = auto_theme_custom,

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
		"lmantw/themify.nvim",

		lazy = false,
		priority = 999,

		config = {
			--- DESC: All the installed Themes.
			"catppuccin/nvim",
			"folke/tokyonight.nvim",
			"rebelot/kanagawa.nvim",
			"ellisonleao/gruvbox.nvim",
			"rktjmp/lush.nvim",
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

			win = {
				border = true,
				padding = { 1, 3 },
			},
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = true,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
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
				{ "<leader><leader>", icon = "" }, -- NOTE: Find File GUI
				{ "<leader>s", group = "Utils", icon = "󰙠" }, --NOTE: Utils GUI
				{ "<leader>u", group = "UI" }, -- NOTE: UI Options GUI
				{ "<leader>c", group = "Code" }, -- NOTE: Code Options GUI
				{ "m", group = "Mini", icon = "󰘨" }, -- NOTE: Mini Options
				{ "<leader>w", icon = "" }, --NOTE: Save File
				{ "<leader>b", group = "Buffer", icon = "" }, --NOTE: Buffer options
				{ "<leader>bh", icon = "" }, --NOTE: Buffer options
				{ "<leader>bv", icon = "┃" }, --NOTE: Buffer options
				{ "<leader>se", group = "toggles", icon = "󰨚" }, --NOTE: Buffer options
				{ "<leader>b", group = "Buffer options", icon = "" }, --NOTE: Buffer options

				{
					"<leader>ljs",
					icon = function()
						if vim.g.live_server then
							return ""
						else
							return ""
						end
					end,
				},
				{
					"<leader>uB",
					icon = function()
						if vim.g.bg_transparent then
							return "󰔡"
						else
							return ""
						end
					end,
				}, --- NOTE: Transparency Toggle

				{ "<leader>l", group = "Languages", icon = "󰅲" }, --- NOTE: Programming Languages
				{ "<leader>lp", group = "Python", icon = "󰌠" }, --- NOTE: Python group
				{ "<leader>lj", group = "Javascript", icon = "" }, --- NOTE: Javascript group

				-- { "<leader>cr", icon = "" }, -- NOTE: Run Code
				-- { "<leader>cf", icon = "" }, -- NOTE: Run File

				{ "<leader>g", group = "Git" }, -- NOTE: Git GUI
				-- { "<leader>fp", icon = "" }, -- NOTE: Find Project GUI
				-- { "<leader>fr", icon = "" }, -- NOTE: Find Recent GUI
				-- { "<leader>gl", icon = "󱀄" }, -- NOTE: Git Log GUI
				-- { "<leader>gs", icon = "󰩮" }, -- NOTE: Git Status GUI
				-- { "<leader>gb", icon = "" }, -- NOTE: Git Branch GUI
				-- { "<leader>gS", icon = "" }, -- NOTE: Git Stash GUI

				{ "<leader>t", icon = "" }, -- NOTE: Terminal Options

				{ "<leader>a", group = "AI", icon = "" }, -- NOTE: AI Options

				{ "<leader>m", group = "Mini / Bookmark", icon = "" }, -- NOTE: Mini / Bookmarks
				{ "<leader>mc", icon = "󰃢" }, -- NOTE : Clean all bookmarks
			})
		end,
	},
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
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
			-- legacy_computing_symbols_support = false,
			legacy_computing_symbols_support = true,

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
		event = "VeryLazy",
		version = "*", -- use latest release
		opts = {
			-- change default options here
		},
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
		},
	},

	{
		"anoopkcn/split-jump.nvim",
		opts = { mappings = false },
	},
}
