return {

	{ "norcalli/nvim-colorizer.lua" },
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

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({ scope = { highlight = highlight } })

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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
			require("bufferline").setup({})
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
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
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
}
