return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup({
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

			local ensure_installed = {
				"vim",
				"vimdoc",
				"lua",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"jsx",
				"c",
				"rust",
				"markdown",
				"json",
			}

			local treesitter_config = require("nvim-treesitter.config")
			local installed = treesitter_config.get_installed()
			local to_install = {}

			for _, parser in ipairs(ensure_installed) do
				if not vim.tbl_contains(installed, parser) then
					table.insert(to_install, parser)
				end
			end

			if #to_install > 0 then
				treesitter.install(to_install)
			end
		end,
	},
}
