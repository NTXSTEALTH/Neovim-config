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

-- In your main config file (e.g., init.lua or config/globals.lua)

-- Defines the action to force Bufferline transparency.
-- This targets all relevant Bufferline groups AND the root Neovim Tabline group.
local function force_bufferline_transparent()
	-- 1. CRITICAL BufferLine Groups (The tabs themselves)
	vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" }) -- The background of the entire bar
	vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" }) -- Unselected/Inactive tabs
	vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "NONE" }) -- The currently selected tab
	vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE" }) -- Separators
	vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "NONE" })

	-- 2. Root Neovim Tabline Groups (Crucial for the area that holds the tabs)
	vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" }) -- Background for unselected tabs (Bufferline usually uses this)
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" }) -- Background for the area after the last tab
	vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" }) -- Background for the selected tab (Bufferline usually overrides this)

	-- OPTIONAL: If transparency is still an issue, you can clear the Normal background again
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
end

_G.ForceBufferlineTransparent = force_bufferline_transparent
