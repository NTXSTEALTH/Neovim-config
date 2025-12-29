--- NOTE:: This file houses all the custom / overridden key binds

--- NOTE: Variables / State
local set = vim.keymap.set

--- NOTE: Toggle Functions

--- Function to toggle live server
function Toggle_live_server()
	vim.g.live_server = not vim.g.live_server
	if vim.g.live_server then
		vim.cmd("LiveServerStart")
	else
		vim.cmd("LiveServerStop")
	end
end

--- Basic binds
set("i", "<A-j>", "<Esc>", { noremap = true, silent = true })
set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
set("n", "<leader>q", "<cmd>:q!<cr>", { desc = "Quit" })

--- GUI / UI Binds
set("n", "<leader><leader>", "<CMD>Telescope find_files<CR>", { desc = "Find Files" })
set("n", "<leader>uB", "<CMD>TransparentToggle<CR>", { desc = "Toggle Transparency", noremap = true, silent = true })

set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
set("n", "<leader>ut", "<CMD>:Themify<CR>", { desc = "Open Themify GUI" })
set("n", "<leader>um", "<CMD>:Mason<CR>", { desc = "Open Mason" })

--- Toggles
set("n", "<leader>t", "<CMD>ToggleTerm direction=float size=60 name=floating<CR>", { desc = "Open Floating Terminal" })
set("n", "<leader>ljs", Toggle_live_server, { desc = "Toggle live server" })

--- LSP
set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostics Float" })
set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
set("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to decleration" })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename all referances" })
set(
	"n",
	"<leader>cv",
	"<cmd>vsplit | lua vim.lsp.buf.defination()<cr>",
	{ desc = "Go To defination in vertical split" }
)

--- MISC Binds
set("n", "<leader>r", "<CMD>RunCode<CR>", { desc = "Run Code" })
