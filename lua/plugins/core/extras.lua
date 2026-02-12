--- NOTE: Some optional plugins for QOL

--- Adds support to Tsx/Jsx commenting.
vim.g.ts_comments = true

--- Adds some comment highlighting>.
vim.g.todo_comments = true

--- A code runner to run files.
vim.g.code_runner = true

--- A Terminal GUI tool which opens up a termial instance inside nvim.
vim.g.toggle_term = true

--- Adds git icon to files and lines.
vim.g.git_signs = true

--- Allow you to use the tab key to move formawd from a matching bracket or quotes.
vim.g.tabout = true

--- Allow you to go to the correponding end.
vim.g.matchup = true

--- A In buffer AI coding agent.
vim.g.neo_codeium = true

--- A smart_backspace plugins that manages indentation.
vim.g.smart_backspace = true

--- A better UI for diagnostics.
vim.g.trouble = true

--- A plugin to render markdown files in nvim.
vim.g.render_markdown = true

return {
	{
		"folke/ts-comments.nvim",
		enabled = vim.g.ts_comments,
		opts = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "BufReadPre",
	},
	{
		"folke/todo-comments.nvim",
		enabled = vim.g.todo_comments,
		event = "BufReadPre",
		dependencies = {},
		opts = {
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				DESC = { icon = "󰉸", color = "desc" },
			},
			colors = {
				desc = { "#f9e2af" },
			},
		},
	},

	{
		"CRAG666/code_runner.nvim",
		enabled = vim.g.code_runner,
		event = "BufReadPre",
		cmd = "RunCode",
		config = function()
			require("code_runner").setup({
				mode = "toggleterm",
				term = {
					position = "float",
					size = 10,
				},
				filetype = {
					python = "uv run $fileName",
					javascript = "node $fileName",
					typescript = "deno run --allow-env --allow-sys --allow-read --allow-net $fileName",
					c = {
						"cd $dir ;",
						"gcc $fileName -o $fileNameWithoutExt.exe ;",
						"./$fileNameWithoutExt.exe",
					},
					cpp = {
						"cd $dir ;",
						"g++ $fileName -o $fileNameWithoutExt.exe ;",
						"./$fileNameWithoutExt.exe",
					},
				},
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		enabled = vim.g.toggle_term,
		cmd = "ToggleTerm",
		event = "VeryLazy",
		opts = {
			persist_size = true,
			shell = "C:\\Users\\rohit\\AppData\\Local\\Programs\\nu\\bin\\nu.exe",
			vim.api.nvim_set_keymap(
				"t",
				"<Esc>",
				"<C-\\><C-N>",
				{ noremap = true, silent = true, desc = "Exit terminal mode" }
			),
			vim.api.nvim_set_keymap(
				"t",
				"<A-j>",
				"<C-\\><C-N>",
				{ noremap = true, silent = true, desc = "Exit terminal mode" }
			),
			direction = "right",
		},

		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		enabled = vim.g.git_signs,
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 100,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
				end

      -- stylua: ignore start
      map("n", "]h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, "Next Hunk")
      map("n", "[h", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, "Prev Hunk")
      map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
      map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
      map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
      map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
      map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
      map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
      map("n", "<leader>ghd", gs.diffthis, "Diff This")
      map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},

	{
		"abecodes/tabout.nvim",
		enabled = vim.g.tabout,
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
				default_shift_tab = "<C-d>", -- reverse shift default action,
				enable_backwards = true, -- well ...
				completion = false, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
	},

	{
		"andymass/vim-matchup",
		event = "BufReadPre",
		opts = {
			treesitter = {
				stopline = 500,
			},
		},
	},

	{
		"monkoose/neocodeium",
		enabled = vim.g.neo_codeium,
		event = "BufReadPre",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<A-f>", neocodeium.accept)
		end,
	},

	{
		"qwavies/smart-backspace.nvim",
		enabled = vim.g.smart_backspace,
		event = "BufReadPre",
	},

	{
		"folke/trouble.nvim",
		enabled = vim.g.trouble,
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
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = vim.g.render_markdown,
		ft = "markdown",

		dependencies = {},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
