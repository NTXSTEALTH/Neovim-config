local manager = require("config.utils.Utility")

local M = {}

function M.toggle_transparency()
	vim.g.transparency = not vim.g.transparency

	if vim.g.transparency then
		vim.cmd("TransparentEnable")
	else
		vim.cmd("TransparentDisable")
	end

	local updated_state = manager.read(manager.path)
	updated_state["transparency"] = vim.g.transparency and "true" or "false"
	manager.write(updated_state, manager.path)
end

function M.Run_code()
	vim.cmd("ToggleTerm direction=float size=60 name=floating")
	vim.cmd("ToggleTerm direction=float size=60 name=floating")
	vim.cmd("RunCode")
end

function M.toggle_codeium()
	vim.cmd({ cmd = "NeoCodeium", args = { "toggle" } })
	local codeium_status = require("neocodeium").get_status()
	if codeium_status == 0 then
		vim.notify("Codeium Enabled")
	elseif codeium_status == 1 then
		vim.notify("Codeium Disabled")
	else
		vim.notify("Codeium Error" .. codeium_status)
	end
end

function M.toggle_live_server()
	vim.g.live_server = not vim.g.live_server
	if vim.g.live_server then
		vim.cmd("LiveServerStart")
	else
		vim.cmd("LiveServerStop")
	end
end

return M
