return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
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
                async = true,
                -- Enabling this would load the colorscheme asynchronously, which might improve your startup time.

                activity = true,
                -- Enabling this would track your colorscheme usage activity.

                -- List of the Themes.
                'folke/tokyonight.nvim',
                "catppuccin/nvim",
                "kepano/flexoki",
                "bluz71/vim-moonfly-colors",
                "olimorris/onedarkpro.nvim",
                "bluz71/vim-nightfly-colors",
                "rebelot/kanagawa.nvim",
                "ellisonleao/gruvbox.nvim",
                "rose-pine/neovim",
                "olivercederborg/poimandres.nvim",
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
                { "<leader>l", icon = "󰒲" }, -- NOTE: Lazy GUI
                { "<leader>x", group = "Diagnostics", icon = "" }, -- NOTE: trouble GUI
                { "<leader>e", icon = "" }, -- NOTE: Neo Tree GUI
                { "<leader>/", icon = "󱁴" }, -- NOTE: File GREP GUI
                { "<leader>f", group = "File", icon = "" }, -- NOTE: File GUI
                { "<leader>fs", icon = "󰑓" }, -- NOTE: Find File GUI
                { "<leader><leader>", icon = "" }, -- NOTE: Find File GUI
                { "<leader>fp", icon = "" }, -- NOTE: Find Project GUI
                { "<leader>fr", icon = "" }, -- NOTE: Find Recent GUI
                { "<leader>g", group = "Git" }, -- NOTE: Git GUI
                { "<leader>gl", icon = "󱀄" }, -- NOTE: Git Log GUI
                { "<leader>gs", icon = "󰩮" }, -- NOTE: Git Status GUI
                { "<leader>gb", icon = "" }, -- NOTE: Git Branch GUI
                { "<leader>gS", icon = "" }, -- NOTE: Git Stash GUI
                { "<leader>s", group = "Utils", icon = "󰙠" }, --NOTE: Utils GUI
                { "<leader>u", group = "UI" }, -- NOTE: UI Options GUI
                { "<leader>c", group = "Code" }, -- NOTE: Code Options GUI
                { "<leader>cr", icon = "" }, -- NOTE: Run Code
                { "<leader>cc", icon = "" }, -- NOTE: Toggle Codium
                { "<leader>cf", icon = "" }, -- NOTE: Run File
                { "m", group = "Mini", icon = "󰘨" }, -- NOTE: Mini Options
                { "<leader>w", icon = "" }, --NOTE: Save File

                { "<leader>b", group = "Tabs", icon = "" }, -- NOTE: Tabs
                { "<leader>bc", icon = "󰛉" }, --NOTE: Close Tab
                { "<leader>br", icon = "󰦛" }, --NOTE: Restore Tab
                { "<leader>bb", icon = "" }, --NOTE: Prev Tab
                { "<leader>bn", icon = "" }, --NOTE: Next Tab
                { "<leader>bB", icon = "" }, --NOTE: Move Tab Right
                { "<leader>bN", icon = "" }, --NOTE: Move Tab Left

                { "<leader>cS", group = "Live Server", icon = "" }, --NOTE: Live Server
                { "<leader>cSs", icon = "" }, --NOTE: Live Server Start
                { "<leader>cSS", icon = "" }, --NOTE: Live Server Stop

                { "<leader>b1", icon = "1" },
                { "<leader>b2", icon = "2" },
                { "<leader>b3", icon = "3" },
                { "<leader>b4", icon = "4" },
                { "<leader>b5", icon = "5" },
                { "<leader>b6", icon = "6" },
                { "<leader>b7", icon = "7" },
                { "<leader>b8", icon = "8" },
                { "<leader>b9", icon = "9" },
            })
        end,
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
    },
}
