return {
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        event = "VeryLazy",
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "onsails/lspkind.nvim",
            "f3fora/cmp-spell",
        },
        config = function()
            local lspkind = require("lspkind")
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "nvim_lsp" },
                    { name = "codeium" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                require("cmp").setup({
                    sources = {
                        {
                            name = "spell",
                            option = {
                                keep_all_entries = false,
                                enable_in_context = function()
                                    return true
                                end,
                                preselect_correct_word = true,
                            },
                        },
                    },
                }),
            })
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",          -- show only symbol annotations
                    maxwidth = {
                        menu = 50,            -- leading text (labelDetails)
                        abbr = 50,            -- actual suggestion item
                    },
                    ellipsis_char = "...",    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    before = function(entry, vim_item)
                        -- ...
                        return vim_item
                    end,
                }),
            }
        end,
    },
    {
        "Exafunction/windsurf.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        -- Ensure it loads on BufEnter or when a command is called
        event = "BufEnter", -- Or "VimEnter" if you want it loaded earlier for global status
        config = function()
            require("codeium").setup({
                virtual_text = { enabled = true },
                -- Your Codeium config here
            })
        end,
    },


}
