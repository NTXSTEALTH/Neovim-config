--- NOTE: Startup function and initialization.

--- DESC: Util functions
local function toboolean(str)
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

--- DESC: State manager to toggle the states in the states.json file
State_manager = require("utils.state")
States = State_manager.read()

--- DESC: State inilization.

vim.g.bg_transparent = toboolean(States.bg_transparent)

--- DESC: Basic Autocommands
if vim.g.bg_transparent then
	vim.cmd("TransparentEnable")
else
	vim.cmd("TransparentDisable")
end
