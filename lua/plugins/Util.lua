return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
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
		"isakbm/gitgraph.nvim",
		event = "VeryLazy",
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = "M",
				commit = "*",
			},
			format = {
				timestamp = "%H:%M:%S %d-%m-%Y",
				fields = { "hash", "timestamp", "author", "branch_name", "tag" },
			},
			hooks = {
				on_select_commit = function(commit)
					print("selected commit:", commit.hash)
				end,
				on_select_range_commit = function(from, to)
					print("selected range:", from.hash, to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gG",
				function()
					require("gitgraph").draw({}, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},
	{
		"barrett-ruth/live-server.nvim",
		event = "VeryLazy",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")
			neocodeium.setup()
			vim.keymap.set("i", "<A-f>", neocodeium.accept)
		end,
	},
	{
		"tomasky/bookmarks.nvim",
		opts = {
			-- sign_priority = 8,  --set bookmark sign priority to cover other sign
			save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
			keywords = {
				["@t"] = "☑️ ",
				["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
				["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
				["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
			},
			on_attach = function(bufnr)
				local bm = require("bookmarks")
				local map = vim.keymap.set
				map("n", "<leader>mm", bm.bookmark_toggle, { desc = "add or remove mark" })
				map("n", "<leader>mi", bm.bookmark_ann, { desc = "add or edit mark" })
				map("n", "<leader>mc", bm.bookmark_clean, { desc = "clean all marks in local buffer" })
				map("n", "<leader>mn", bm.bookmark_next, { desc = "Jump to next mark" }) -- jump to next mark in local buffer
				map("n", "<leader>mp", bm.bookmark_prev, { desc = "Jump to previous Mark" }) -- jump to previous mark in local buffer
				map("n", "<leader>ml", bm.bookmark_list, { desc = "List all markers" }) -- show marked file list in quickfix window
				map("n", "<leader>mx", bm.bookmark_clear_all, { desc = "Clean all markers" }) -- removes all bookmarks
			end,
		},
		-- tag = 'release' -- To use the latest release
	},
	{
		"abecodes/tabout.nvim",
		lazy = false,
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
		dependencies = { -- These are optional
			"nvim-treesitter/nvim-treesitter",
		},
		opt = true, -- Set this to true if the plugin is optional
		event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
		priority = 1000,
	},
}
