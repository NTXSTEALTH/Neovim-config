return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        -- This is Theme manager plugins to cycle between different themes.
        'lmantw/themify.nvim',

        lazy = false,
        priority = 999,

        config = function()
            require('themify').setup({
                -- List of the Themes.
                'folke/tokyonight.nvim',
                "catppuccin/nvim",
                'default'
            })
        end

    },
    {
        -- NOTE: This is Lua line a status line plugin.
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },
    {
        -- NOTE: This is a indent highlight plugin to highlight different levels of indentation.
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},

        config = function()
            require("ibl").setup()
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            -- ignore_missing = false,
            plugins = {
                marks = true,     -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                spelling = {
                    enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ...
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true,            -- bindings for prefixed with g
                },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader>l", icon = "󰒲" },
                { "<leader>e", icon = "" },
                { "<leader>/", icon = "󱁴" },
                { "<leader>f", group = "File", icon = "" },
                { "<leader><leader>", icon = "" },
                { "<leader>fp", icon = "" },
                { "<leader>fr", icon = "" },
                { "<leader>g", group = "Git" },
                { "<leader>gl", icon = "󱀄" },
                { "<leader>gs", icon = "󰩮" },
                { "<leader>gb", icon = "" },
                { "<leader>gS", icon = "" },
                { "<leader>s", group = "Utils", icon = "󰙠" },
                { "<leader>d", group = "Debugger" },
                { "<leader>u", group = "UI" },
                { "<leader>c", group = "Code" },
                { "<leader>cr", icon = "" },
                { "<leader>cc", icon = "" },
                { "<leader>cf", icon = "" },
                { "<leader>p", group = "Python", icon = "󰌠" },
                { "m", group = "Mini", icon = "󰘨" },
                { "<leader>b", group = "Tabs", icon = "" },
                { "<leader>o", group = "File options", icon = "󰲌" },
                { "<leader>w", icon = "" },
            })
        end,
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        require("noice").setup({
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
            },
            views = {
                cmdline_popup = {
                    border = {
                        style = "none",
                        padding = { 2, 3 },
                    },
                    filter_options = {},
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            },
        })
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    }

}
