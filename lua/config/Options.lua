-- NOTE: Tabs are 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- NOTE: Editor options.
-- vim.cmd.colorscheme("catppuccin")
vim.opt.fileformats = "unix,dos"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.undofile = true

vim.opt.spelllang = { "en_us" }
vim.opt.spell = true

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.opt.showmode = false
vim.opt.swapfile = false

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.opt.updatetime = 100

vim.lsp.enable = true

-- NOTE: Spell Checking Changes.
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "Blue" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "Cyan" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "Magenta" })
vim.api.nvim_set_hl(0, "SpellBad", { underline = true })
vim.api.nvim_set_hl(0, "SpellCap", { underline = true })
vim.api.nvim_set_hl(0, "SpellRare", { underline = true })
vim.api.nvim_set_hl(0, "SpellLocal", { underline = true })
