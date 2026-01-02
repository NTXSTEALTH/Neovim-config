--- NOTE: Houses all the autocommands.

--- DESC: Get all the enabled states.
vim.api.nvim_create_autocmd("vimEnter", {
	callback = function()
		require("config.startup")
	end,
})
