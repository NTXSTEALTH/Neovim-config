--- |=========|
--- | Keymaps |
--- |=========|

local set = vim.keymap.set

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

---| File Exploreres
set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Open Oil in float" })
set(
	"n",
	"<leader><leader>",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	{ desc = "Find Files" }
)
