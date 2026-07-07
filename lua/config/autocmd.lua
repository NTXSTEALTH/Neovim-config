local augroup = vim.api.nvim_create_augroup("UserConfig", {clear = true})
local create = vim.api.nvim_create_autocmd



--- Highlight on yank

create("TextYankPost",{
    group = augroup,
    callback = function()
        vim.hl.on_yank()
    end,
})

