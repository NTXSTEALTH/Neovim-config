--- NOTE: This config file contains all the core plugins for the editor

--- Treesitter : Syntax Highlighting.
--- Snacks     : collection of utility functions.
--- Mini       : collection of QOL motions and utilities.
--- Flash      : A fast positiing plugin.
--- bento      : A buffer manager plugin.

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"python",
					"javascript",
					"typescript",
					"tsx",
					"json",
					"html",
					"css",
					"nu",
				},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})

			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) then
					pcall(vim.treesitter.start, buf)
				end
			end

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},

	-- { "nvim-treesitter/nvim-treesitter-textobjects" },

	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-lua/plenary.nvim", event = "VeryLazy" },
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,

		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 2000,
			},
			picker = { enabled = true, hidden = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			styles = {
				notification = {
					-- wo = { wrap = true } -- Wrap notifications
				},
			},
		},
		keys = {
			{
				"<leader>n",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>sB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sw",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			{
				"<leader>s/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>sa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>si",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>sm",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>su",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},

			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end

					-- Override print to use snacks for `:=` command
					if vim.fn.has("nvim-0.11") == 1 then
						vim._print = function(_, ...)
							dd(...)
						end
					else
						vim.print = _G.dd
					end

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
				end,
			})
		end,
	},

	{
		"echasnovski/mini.nvim",
		event = "BufReadPre",
		version = false, -- use latest dev version
		config = function()
			require("mini.pairs").setup({})
			require("mini.icons").setup({
				style = "glyph",
				default = {},
				directory = {},
				extension = {},
				file = {},
				filetype = {},
				lsp = {},
				os = {},
				use_file_extension = function(ext, file)
					return true
				end,
			})
			require("mini.surround").setup({
				mappings = {
					add = "msa",
					delete = "msd",
					replace = "msr",
					find = "msf",
					find_left = "msF",
					highlight = "msh",
					update_n_lines = "msn",
				},
			})
			require("mini.ai").setup({
				n_lines = 500,
			})

			require("mini.move").setup({
				mappings = {
					left = "<C-h>",
					right = "<C-l>",
					down = "<C-j>",
					up = "<C-k>",

					line_left = "<C-h>",
					line_right = "<C-l>",
					line_down = "<C-j>",
					line_up = "<C-k>",
				},

				options = {
					reindent_linewise = true,
				},
			})

			require("mini.comment").setup({})
			require("mini.diff").setup({})
			require("mini.align").setup({})
		end,
	},

	{
		"folke/flash.nvim",
		event = "BufReadPre",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{ "serhez/bento.nvim", opts = {} },
}
