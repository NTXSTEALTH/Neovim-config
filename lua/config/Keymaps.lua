--- NOTE: This file houses all the custom / overridden key binds

--- NOTE: Variables / State
local set = vim.keymap.set

local toggle = require("utils.toggles")

--- DESC: Basic binds
set("i", "<A-j>", "<Esc>", { noremap = true, silent = true })
set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
set("n", "<leader>q", "<cmd>:q!<cr>", { desc = "Quit" })

set("n", "<C-w>", "<cmd>:w<cr>", { desc = "Save" })
set("n", "<C-q>", "<cmd>:q!<cr>", { desc = "Quit" })

set("n", "<leader>bv", "<cmd>vs<cr>", { desc = "Vertical Split" })
set("n", "<leader>bh", "<cmd>sp<cr>", { desc = "Horizontal Split" })

---  DESC: GUI / UI Binds

-- Lua keymap example
set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Open Oil in float" })

-- set({ "<leader>e", function() require("oil").toggle_float() end, desc = "Toggle Oil Float" })

set(
	"n",
	"<leader><leader>",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	{ desc = "Find Files" }
)
set("n", "<leader>uB", toggle.toggle_transparency, { desc = "Toggle Transparency", noremap = true, silent = true })

set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
set("n", "<leader>ut", "<CMD>:Themify<CR>", { desc = "Open Themify GUI" })
set("n", "<leader>um", "<CMD>:Mason<CR>", { desc = "Open Mason" })

set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete Buffer" })

---  DESC: Toggles
set("n", "<leader>t", "<CMD>ToggleTerm direction=float size=60 name=floating<CR>", { desc = "Open Floating Terminal" })
set("n", "<leader>ljs", toggle.toggle_live_server, { desc = "Toggle live server" })
set("n", "<leader>sea", toggle.toggle_codeium, { desc = "Toggle Codeium" })

---  DESC: LSP
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

--- DESC: Sessions controls
set("n", "<leader>ss", "<cmd>mksession<cr>", { desc = "Save Session" })

--- DESC: MISC Binds
set("n", "<leader>r", toggle.Run_code, { desc = "Run Code" })
