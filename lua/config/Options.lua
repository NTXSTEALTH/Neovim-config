vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- vim.cmd.colorscheme("catppuccin")
vim.opt.fileformats = "unix,dos"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.undofile = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "Red" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "Blue" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "Cyan" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "Magenta" })
vim.api.nvim_set_hl(0, "SpellBad", { underline = true })
vim.api.nvim_set_hl(0, "SpellCap", { underline = true })
vim.api.nvim_set_hl(0, "SpellRare", { underline = true })
vim.api.nvim_set_hl(0, "SpellLocal", { underline = true })

vim.opt.timeout = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0
