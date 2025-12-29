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

--- Function to Codeium.
function M.toggle_codeium()
	if require("neocodeium").get_status()[1] == 0 then
		vim.cmd("NeoCodeium enable")
	else
		vim.cmd("NeoCodeium disable")
	end
	local state = state_manager.read()
	state["bg_transparent"] = vim.g.bg_transparent and "true" or "false"
	state_manager.write(state)
end
-- set("n", "<leader>Ea", "<CMD>NeoCodeium toggle<CR>", { desc = "Disable Codeium" })

return M
