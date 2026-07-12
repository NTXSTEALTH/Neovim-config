vim.api.nvim_create_user_command("FixwinPath", function()
	vim.cmd("normal! gv")

	---@diagnostic disable-next-line: deprecated
	local _, srow, scol, _ = unpack(vim.fn.getpos("'<"))
	---@diagnostic disable-next-line: deprecated
	local _, erow, ecol, _ = unpack(vim.fn.getpos("'>"))
	local lines = vim.api.nvim_buf_get_text(0, srow - 1, scol - 1, erow - 1, ecol, {})
	local text = table.concat(lines, "\n")

	local escaped_text = text:gsub("\\", "\\\\")

	vim.api.nvim_buf_set_text(0, srow - 1, scol - 1, erow - 1, ecol, vim.split(escaped_text, "\n"))

	vim.cmd("normal! \x1b")
end, { range = true })
