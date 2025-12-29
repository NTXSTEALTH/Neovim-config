--- NOTE: Toggle Functions

local state_manager = require("utils.state")

local M = {}

--- Function to toggle live server.
function M.toggle_live_server()
	vim.g.live_server = not vim.g.live_server
	if vim.g.live_server then
		vim.cmd("LiveServerStart")
	else
		vim.cmd("LiveServerStop")
	end
end

--- Function to toggle background Transparency.
function M.toggle_transparency()
	vim.g.bg_transparent = not vim.g.bg_transparent

	if vim.g.bg_transparent then
		vim.cmd("TransparentEnable")
	else
		vim.cmd("TransparentDisable")
	end

	local state = state_manager.read()
	state["bg_transparent"] = vim.g.bg_transparent and "true" or "false"
	state_manager.write(state)
end

--- Function to Toggle Codeium.
function M.toggle_codeium()
	vim.cmd({ cmd = "NeoCodeium", args = { "toggle" } })
	local codeium_status = require("neocodeium").get_status()
	if codeium_status == 0 then
		vim.notify("Codeium Disabled")
	elseif codeium_status == 1 then
		vim.notify("Codeium Enabled")
	else
		vim.notify("Codeium Error" .. codeium_status)
	end
end

return M
