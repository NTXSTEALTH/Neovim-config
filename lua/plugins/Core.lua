return {
    {
        -- NOTE: Core plugins for syntax highlighting.
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",

        ensure_installed = { "lua", "nu", "markdown", "markdown_inline", "Python", "html", "css", "javascript", "typescript", "json", "c", "cpp", "tsx", "jsx" },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                },
            }
        end
    },

    {
        -- NOTE: Fuzzy finder to search files.
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-ui-select.nvim'
    },
    {
        -- NOTE: A collection of QOL plugins.
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = {
                enabled = true,
                auto_close = true,
            },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 2000,
            },
            picker = { enabled = true, replace_netrw = true, hidden = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                }
            }
        },
        keys = {

            -- Top Pickers & Explorer
            { "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },

            -- find
            { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
            { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },

            -- git
            { "<leader>gg", function() Snacks.lazygit() end,                                        desc = "Lazygit", },
            { "<leader>gb", function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
            { "<leader>gl", function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
            { "<leader>gL", function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
            { "<leader>gs", function() Snacks.picker.git_status() end,                              desc = "Git Status" },
            { "<leader>gS", function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
            { "<leader>gd", function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
            { "<leader>gf", function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },

            -- Grep
            { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
            { "<leader>sg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
            { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },

            -- search
            { '<leader>s"', function() Snacks.picker.registers() end,                               desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end,                          desc = "Search History" },
            { "<leader>sb", function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
            { "<leader>sc", function() Snacks.picker.command_history() end,                         desc = "Command History" },
            { "<leader>sC", function() Snacks.picker.commands() end,                                desc = "Commands" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end,                              desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
            { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
            { "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
            { "<leader>sp", function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
            { "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
            { "<leader>sR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
            { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
            { "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },

            -- LSP
            { "gd",         function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
            { "gy",         function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
            { "<leader>ss", function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
            { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },

            -- Other
            { "<leader>.",  function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
            { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
            { "<leader>n",  function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
            { "<leader>un", function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
            { "]]",         function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",           mode = { "n", "t" } },
            { "[[",         function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",           mode = { "n", "t" } },
        },

        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    Snacks.toggle.diagnostics():map("<leader>ud")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle.option("conceallevel",
                        { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
                        "<leader>ub")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                    Snacks.toggle.indent():map("<leader>ug")
                    Snacks.toggle.dim():map("<leader>uD")
                end,
            })
        end,
    },
    -- {
    --     -- NOTE: File Explorer.
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         "nvim-tree/nvim-web-devicons", -- optional, but recommended
    --     },
    --     -- lazy = true,                       -- neo-tree will lazily load itself
    -- },
    {
        "echasnovski/mini.nvim",
        event = "VeryLazy",
        version = false, -- use latest dev version
        config = function()
            require("mini.pairs").setup({})
            require("mini.icons").setup(
                {
                    style = "glyph",
                    default = {},
                    directory = {},
                    extension = {},
                    file = {},
                    filetype = {},
                    lsp = {},
                    os = {},
                    use_file_extension = function(ext, file)
                        return true
                    end,
                }
            )
            require("mini.surround").setup({
                mappings = {
                    add = "msa",
                    delete = "msd",
                    replace = "msr",
                    find = "msf",
                    find_left = "msF",
                    highlight = "msh",
                    update_n_lines = "msn",
                },
            })
            require("mini.indentscope").setup({
                draw = {
                    delay = 0,
                    priority = 100,
                },
            })
            require("mini.ai").setup({
                n_lines = 500,
            })
            require("mini.sessions").setup({})
            -- require("mini.comment").setup({})
        end,
    },
    {
        -- NOTE: This is a comment plugins to add comments to all the file types.
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        config = function()
            require('Comment').setup()
        end
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
            enable = true,
            enable_autocmd = false,
        },

        config = function(_, opts)
            require('ts_context_commentstring').setup {
            }
        end
    },

}
