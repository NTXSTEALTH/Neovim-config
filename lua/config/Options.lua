--- NOTE: Houses all nvim setting changes and custom overrides.

--- DESC: Tabs are 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- : Editor options.
-- vim.cmd.colorscheme("catppuccin")
-- vim.opt.fileformats = "unix,dos"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.undofile = true

vim.opt.spelllang = { "en_us" }
vim.opt.spell = true

vim.opt.clipboard = "unnamedplus"

vim.opt.showmode = false
vim.opt.swapfile = false

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

local shell_path = "C:\\Users\\rohit\\AppData\\Local\\Programs\\nu\\bin\\nu.exe"

vim.o.shell = shell_path
vim.o.shellcmdflag = "-c"
vim.o.shellquote = ""
vim.o.shellxquote = ""
vim.o.shellredir = "out+err> %s"
vim.o.shellpipe = "| tee %s"

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

vim.opt.updatetime = 300

-- Standardize the path for Windows
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_bin .. ";" .. vim.env.PATH
