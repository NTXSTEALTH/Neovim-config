--PERF: This file houses all the custom / overridden key binds

-- NOTE: Nav Key binds
vim.keymap.set("i", "<A-j>", "<Esc>", { noremap = true, silent = true })

--NOTE: Toggle Transparent Background.
vim.keymap.set(
	"n",
	"<leader>uB",
	"<CMD>TransparentToggle<CR>",
	{ desc = "Tooggle Transparency", noremap = true, silent = true }
)
-- NOTE: Open lazy GUI
vim.keymap.set("n", "<leader>l", "<CMD>Lazy<CR>", { desc = "Open Lazy" })

-- NOTE:Open Themify GUI
vim.keymap.set("n", "<leader>ut", "<CMD>:Themify<CR>", { desc = "Open Themify GUI" })

-- NOTE: Open Mason GUI
vim.keymap.set("n", "<leader>um", "<CMD>:Mason<CR>", { desc = "Open Mason" })

-- NOTE: File Tree GUI
-- vim.keymap.set("n", "<leader>E", "<cmd>:Neotree toggle<cr>", { desc = "toggle neotree" })
vim.keymap.set("n", "<leader>e", "<cmd>:lua Snacks.explorer()<cr>", { desc = "toggle Explorer" })

-- NOTE: Save file
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })

vim.keymap.set("n", "<leader>q", "<cmd>:q!<cr>", { desc = "Quit" })

-- NOTE: Source File
vim.keymap.set("n", "<leader>fs", "<cmd>:so<cr>", { desc = "Source File" })

-- NOTE: BufferLine Controls
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "next tab" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", { desc = "prev tab" })
vim.keymap.set("n", "<leader>bN", "<cmd>BufferLineMovePrev<cr>", { desc = "move tab Left" })
vim.keymap.set("n", "<leader>bB", "<cmd>BufferLineMoveNext<cr>", { desc = "move tab Right" })

vim.keymap.set("n", "<leader>b1", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b2", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b3", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b4", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b5", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b6", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b7", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b8", "<Cmd>BufferLineGoToBuffer 8<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b9", "<Cmd>BufferLineGoToBuffer 9<CR>", { desc = "tab" })

vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Close Buffer" })

vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Buffer Pin" })
-- vim.keymap.set("n", "<leader>bg", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Buffer Pin" })

-- NOTE: File Binds
vim.keymap.set("n", "<leader>fF", vim.lsp.buf.format, { desc = "Format File" })
vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Yank to clipboard" })

-- NOTE: Terminal
vim.keymap.set(
	"n",
	"<leader>tt",
	"<CMD>ToggleTerm direction=vertical size=60 name=main<CR>",
	{ desc = "Open Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tf",
	"<CMD>ToggleTerm direction=float size=60 name=floating<CR>",
	{ desc = "Open Floating Terminal" }
)
vim.keymap.set(
	"n",
	"<leader>tT",
	"<CMD>ToggleTerm direction=tab size=60 name=floating<CR>",
	{ desc = "Open Terminal Tab" }
)

-- NOTE: Code Runner bind
vim.keymap.set("n", "<leader>cf", "<CMD>RunFile<CR>", { desc = "Run File" })
vim.keymap.set("n", "<leader>cr", "<CMD>RunCode<CR>", { desc = "Run Code" })

-- NOTE: LSP binds
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cx", vim.lsp.buf.rename, { desc = "Rename" })

-- NOTE: Telescope binds
vim.keymap.set("n", "<leader><leader>", "<CMD>Telescope find_files<CR>", { desc = "Run File" })

-- NOTE: Codium AI binds
vim.keymap.set("n", "<leader>at", "<CMD>NeoCodeium toggle<CR>", { desc = "Toggle Codium" })
vim.keymap.set("n", "<leader>ar", "<CMD>NeoCodeium restart<CR>", { desc = "Restart Codium" })

-- NOTE: Keybinds to live server
vim.keymap.set("n", "<leader>cSs", "<cmd>LiveServerStart<cr>", { desc = "Start live server" })
vim.keymap.set("n", "<leader>cSS", "<cmd>LiveServerStop<cr>", { desc = "Stop live server" })

--NOTE: Default Vim binds override
