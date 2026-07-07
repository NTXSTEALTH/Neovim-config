return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local treesitter = require("nvim-treesitter")
			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
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
