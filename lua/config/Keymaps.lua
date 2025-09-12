--PERF: This file houses all the custom / overridden key binds

-- NOTE: Nav Key binds
vim.keymap.set('i', '<A-j>', '<Esc>', { noremap = true, silent = true })
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
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>q", "<cmd>:q!<cr>", { desc = " force quit" })

-- NOTE: Source File
vim.keymap.set("n", "<leader>fs", "<cmd>:so<cr>", { desc = "Source File" })

-- NOTE: Buffer Controls
vim.keymap.set("n", "<leader>bn", "<cmd>BufferNext<cr>", { desc = "next tab" })
vim.keymap.set("n", "<leader>bb", "<cmd>BufferPrevious<cr>", { desc = "prev tab" })
vim.keymap.set("n", "<leader>bN", "<cmd>BufferMovePrevious<cr>", { desc = "move tab Left" })
vim.keymap.set("n", "<leader>bB", "<cmd>BufferMoveNext<cr>", { desc = "move tab Right" })

vim.keymap.set("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b6", "<Cmd>BufferGoto 6<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b7", "<Cmd>BufferGoto 7<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b8", "<Cmd>BufferGoto 8<CR>", { desc = "tab" })
vim.keymap.set("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", { desc = "tab" })

vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>br", "<Cmd>BufferRestore<CR>", { desc = "Restore Buffer" })

-- NOTE: File Binds
vim.keymap.set("n", "<leader>fF", vim.lsp.buf.format, { desc = "Format File" })
vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = "Yank to clipboard" })

-- NOTE: Terminal
vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm direction=vertical size=60 name=main<CR>", { desc = "Open Terminal" })

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
vim.keymap.set("n", "<leader>cc", "<CMD>Codeium Toggle<CR>", { desc = "Toggle Codium" })

-- NOTE: Keybinds to live server
vim.keymap.set("n", "<leader>cSs", "<cmd>LiveServerStart<cr>", { desc = "Start live server" })
vim.keymap.set("n", "<leader>cSS", "<cmd>LiveServerStop<cr>", { desc = "Stop live server" })
