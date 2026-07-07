--- NOTE: Utility Functions

local M = {}
local json = vim.json
Path = vim.fn.stdpath("state") .. "\\state.json"

function M.read()
	local ok, lines = pcall(vim.fn.readfile, Path)
	if not ok then
		return {}
	end

	local content = table.concat(lines, "\n")
	return json.decode(content)
end

function M.write(tbl)
	local encode = json.encode(tbl, { indent = true })
	vim.fn.writefile({ encode }, Path)
end

return M
