return {

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "basedpyright",
                "clangd",
                "emmet_language_server",
                -- "eslintd",
                -- "prettierd",
                "lua_ls",
                "ruff",
                "rust_analyzer",
                "ts_ls",
            },
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {}
            },
            { "neovim/nvim-lspconfig", }
        },

    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        })
                    end
                end,
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettierd,
                },
            })
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                json = { "prettierd" },
                css = { "prettierd" },
                scss = { "prettierd" },
                html = { "prettierd" },
                yaml = { "prettierd" },
                markdown = { "prettierd" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true, -- Crucial: if conform can't format, it tries LSP formatters
            },

        },
    },
}
