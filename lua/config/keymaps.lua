--- |=========|
--- | Keymaps |
--- |=========|

local set = vim.keymap.set
local toggle = require("config.utils.Toggles")

---| Basic binds
set("i", "<A-j>", "<ESC>", { silent = true, desc = "Esc" })
set("n", "<leader>w", "<CMD>:w<CR>", { silent = true, desc = "Write" })
set("n", "<leader>q", "<CMD>:q<CR>", { silent = true, desc = "Quit" })
set("n", "<leader>Q", "<CMD>:q!<CR>", { silent = true, desc = "Force Quit" })
---

-- set("n", "<C-j>", ":m .+1<CR>==", { silent = true, desc = "Move line up" })
-- set("n", "<C-k>", ":m .-2<CR>==", { silent = true, desc = "Move line down" })
-- set("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection up" })
-- set("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection down" })
-- set({ "n", "v" }, "<C-h>", "<gv", { silent = true, desc = "indent left" })
-- set({ "n", "v" }, "<C-l>", ">gv", { silent = true, desc = "indent right" })

---| LSP binds
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

---| Snippets keybinds
local ls = require("luasnip")
set({ "i", "s" }, "<A-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "Expand Snippet" })
set({ "i", "s" }, "<A-p>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "Jump to previous snippet" })

---| File Exploreres
set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Open Oil in float" })
set(
	"n",
	"<leader><leader>",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	{ desc = "Find Files" }
)

--- Utility Binds

set("n", "<leader>L", "<CMD>Lazy<CR>", { desc = "Open Lazy" })
set("n", "<leader>ut", "<CMD>:Themify<CR>", { desc = "Open Themify GUI" })
set("n", "<leader>um", "<CMD>:Mason<CR>", { desc = "Open Mason" })
set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete Buffer" })

---  DESC: Toggles
set("n", "<leader>r", toggle.Run_code, { desc = "Run Code" })
set("n", "<leader>t", "<CMD>ToggleTerm direction=float size=60 name=floating<CR>", { desc = "Open Floating Terminal" })
set("n", "<leader>ljs", toggle.toggle_live_server, { desc = "Toggle live server" })
set("n", "<leader>sea", toggle.toggle_codeium, { desc = "Toggle Codeium" })
set("n", "<leader>uB", toggle.toggle_transparency, { desc = "Toggle Transparency", noremap = true, silent = true })
