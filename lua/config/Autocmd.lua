-- In your autocommands file (e.g., autocommands.lua)

-- Set up the autocommand group and call the global function
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("BufferlineTransparency", { clear = true }),
	callback = function()
		if _G.ForceBufferlineTransparent then
			_G.ForceBufferlineTransparent()
		end
	end,
})
