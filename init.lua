--- NOTE: Entry file for Nvim.

-- Add Mason's bin folder to the system PATH so native LSP can find the executables
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
if vim.fn.has("win32") == 1 then
	vim.env.PATH = mason_bin .. ";" .. vim.env.PATH
else
	vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

--- NOTE: Config Files
require("utils.state")
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
