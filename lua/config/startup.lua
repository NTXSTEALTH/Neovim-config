-- vim.notify("state loaded", vim.log.levels.INFO)
local Path = vim.fn.stdpath("state") .. "\\state.json"

local manager = require("config.utils.Utility")
States = manager.read(Path)

for k, v in pairs(States) do
	vim.g[k] = manager.is_true(v)
	-- print(vim.g[k])
end

-- manager.print_table(States)
