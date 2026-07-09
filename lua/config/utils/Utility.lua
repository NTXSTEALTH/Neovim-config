local json = vim.json

local M = {}

M.path = vim.fn.stdpath("state") .. "\\state.json"

function M.is_true(str)
	if type(str) ~= "string" then
		return nil
	end
	str = str:lower()
	if str == "true" then
		return true
	end
	if str == "false" then
		return false
	end
	return nil
end

function M.print_table(tbl)
	for k, v in pairs(tbl) do
		print(k, v)
	end
end

function M.read(path)
	local ok, line = pcall(vim.fn.readfile, path)
	if not ok then
		return {}
	end

	local file_content = table.concat(line, "\n")
	return json.decode(file_content)
end

function M.write(tbl, path)
	local ok, encode = pcall(json.encode, tbl)
	if not ok then
		vim.notify("Failed to encode state", vim.log.levels.ERROR)
		return
	end
	vim.fn.writefile({ encode }, path)
end

return M
