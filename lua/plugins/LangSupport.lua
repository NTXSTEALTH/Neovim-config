return {

    -- NOTE: WebDev support [ HTML, CSS, JS, Tailwind, React]

    {
        'barrett-ruth/live-server.nvim',
        build = 'pnpm add -g live-server',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        event = "VeryLazy",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end,
    },
    {
        'grvcoelho/vim-javascript-snippets'
    },
    {
        "cjodo/convert.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        keys = {
            -- { "<leader>cn", "<cmd>ConvertFindNext<CR>",    desc = "Find next convertable unit" },
            -- { "<leader>cc", "<cmd>ConvertFindCurrent<CR>", desc = "Find convertable unit in current line" },
            -- {
            --     "<leader>ca",
            --     "<cmd>ConvertAll<CR>",
            --     mode = { "n", "v" },
            --     desc = "Convert all of a specified unit",
            -- },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = true, -- Auto close on trailing </
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = false,
                    },
                },
            })
        end,
    },
    {
        'andymass/vim-matchup',
        init = function()
            -- modify your configuration vars here
            vim.g.matchup_treesitter_stopline = 500

            -- or call the setup function provided as a helper. It defines the
            -- configuration vars for you
            require('match-up').setup({
                treesitter = {
                    stopline = 500
                }
            })
        end,
        -- or use the `opts` mechanism built into `lazy.nvim`. It calls
        -- `require('match-up').setup` under the hood
        ---@type matchup.Config
        opts = {
            treesitter = {
                stopline = 500,
            }
        }
    },

    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
            tailwind = true,
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
}
