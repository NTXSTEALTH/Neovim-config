--- Util functions
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

--- State manager to toggle the states in the states.json file
State_manager = require("utils.state")
States = State_manager.read()

--- NOTE: State inilization.

--- Assigning the transparency.
vim.g.bg_transparent = toboolean(States.bg_transparent)

--- NOTE: Basic Autocommands
if vim.g.bg_transparent then
	vim.cmd("TransparentEnable")
else
	vim.cmd("TransparentDisable")
end
