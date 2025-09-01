-- NOTE: This is the main file that houses lazy Neovim.
require("config.Lazy")

-- NOTE: These are the custom config files.
require("config.Options")
require("config.Keymaps")

-- NOTE: Loading custom snippets.
-- require("luasnip.loaders.from_vscode").load({ paths = { "./lua/snippets" } })
