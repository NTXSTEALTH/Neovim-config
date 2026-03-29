--- NOTE: Houses all the autocommands.

--- DESC: Get all the enabled states.
vim.api.nvim_create_autocmd("vimEnter", {
	callback = function()
		require("config.startup")
	end,
})

--- DESC: Open alpha-nvim if the current buffer is a directory
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
			require("snacks").dashboard.open()
		end
	end,
})
