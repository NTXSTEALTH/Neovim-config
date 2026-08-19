--- Which Key
return {
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
				{ "<leader>e", icon = "" }, -- NOTE: File Explorer
				{ "<leader>E", icon = "" }, -- NOTE: File Explorer
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
						if vim.g.toggle_live_server then
							return ""
						else
							return ""
						end
					end,
				},
				{
					"<leader>uB",
					icon = function()
						if vim.g.transparency then
							return ""
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
			})
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
				NOTE = { icon = "", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				DESC = { icon = "󰉸", color = "desc" },
			},
			colors = {
				desc = { "#f9e2af" },
			},
		},
	},

	{
		"serhez/bento.nvim",
		event = "BufReadPre",
		opts = {},
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
		"CRAG666/code_runner.nvim",
		-- enabled = false,
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
					-- c = {
					-- 	"cd $dir ;",
					-- 	"gcc $fileName -o $fileNameWithoutExt.exe ;",
					-- 	"./$fileName",
					-- },
					-- c = "powershell -Command \"Set-Location '$dir'; make run\"",
					c = {
						"powershell -Command \"Set-Location '$dir'; make run\"",
						"gcc $fileName -o $fileNameWithoutExt.exe ;",
						"./$fileNameWithoutExt.exe",
					},
					cpp = {
						"cd $dir ;",
						"g++ $fileName -o $fileNameWithoutExt.exe ;",
						"./$fileNameWithoutExt.exe",
					},
					rust = "powershell -Command \"Set-Location '$dir/..'; cargo run -q \"",
					lua = "lua $fileName",
				},
			})
		end,
	},
}
