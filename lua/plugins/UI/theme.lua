--- |=== Plugins ===|
--- Lua line
--- Noice
--- Smear cursor
--- hlchunk
--- cinnamon
--- transparent
--- |===============|

return {
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

		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			{ "MunifTanjim/nui.nvim", event = "VeryLazy" },
		},
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
		"declancm/cinnamon.nvim",
		event = "VeryLazy",
		version = "*", -- use latest release
		opts = {
			-- change default options here
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
}
