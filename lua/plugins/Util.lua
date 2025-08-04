-- NOTE: Contains config's for
-- - Code Runner
-- - ToggleTerm

return {
    -- Code Runner Config
    {
        "CRAG666/code_runner.nvim",
        cmd = "RunCode",
        config = function()
            require("code_runner").setup({
                mode = "toggleterm",
                term = {
                    position = "horizontal",
                    size = 10,
                },
                filetype = {
                    python = "uv run $fileName",
                    c = {
                        "cd $dir ;",
                        "gcc $fileName -o $fileNameWithoutExt.exe ;",
                        "./$fileNameWithoutExt.exe",
                    },
                },
            })
        end,
    },

    -- Toggle term Config
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        opts = { --[[ things you want to change go here]]
            shell = "C:\\Users\\rohit\\AppData\\Local\\Programs\\nu\\bin\\nu.exe",
            vim.api.nvim_set_keymap(
                "t",
                "<Esc>",
                "<C-\\><C-N>",
                { noremap = true, silent = true, desc = "Exit terminal mode" }
            ),
            direction = "right",
        },

        config = function(_, opts)
            require("toggleterm").setup(opts)
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
