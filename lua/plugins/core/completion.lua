return {
	{
		"saghen/blink.cmp",
		event = "VeryLazy",
		dependencies = { { "rafamadriz/friendly-snippets", event = "VeryLazy" } },

		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },
			appearance = {
				nerd_font_variant = "mono",
			},

			completion = { documentation = { auto_show = true } },

			snippets = { preset = "luasnip" },

			sources = {
				default = { "snippets", "lsp", "path", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"xzbdmw/colorful-menu.nvim",
		event = "BufReadPre",
		enabled = vim.g.colorful_menu,
		config = function()
			-- You don't need to set these options.
			require("colorful-menu").setup({
				ls = {
					lua_ls = {
						arguments_hl = "@comment",
					},
					ts_ls = {
						extra_info_hl = "@comment",
					},
					["rust-analyzer"] = {
						-- Such as (as Iterator), (use std::io).
						extra_info_hl = "@comment",
						-- Similar to the same setting of gopls.
						align_type_to_right = true,
						-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
						preserve_type_when_truncate = true,
					},
					clangd = {
						-- Such as "From <stdio.h>".
						extra_info_hl = "@comment",
						-- Similar to the same setting of gopls.
						align_type_to_right = true,
						-- the hl group of leading dot of "•std::filesystem::permissions(..)"
						import_dot_hl = "@comment",
						-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
						preserve_type_when_truncate = true,
					},
					-- The same applies to pyright/pylance
					basedpyright = {
						-- It is usually import path such as "os"
						extra_info_hl = "@comment",
					},
					-- If true, try to highlight "not supported" languages.
					fallback = true,
					-- this will be applied to label description for unsupport languages
					fallback_extra_info_hl = "@comment",
				},
				fallback_highlight = "@variable",
				max_width = 60,
			})
		end,
	},

	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		version = "v2.*",
		build = "make install_jsregexp",

		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node

			--- LUA snippets.
			ls.add_snippets("lua", {
				s("tbl", {
					t("local "),
					i(1),
					t("= {"),
					i(2),
					t("}"),
				}),
			})

			--- Python Snippets.
			ls.add_snippets("python", {
				--- creates a main funtin along with if __name__ == '__main__':
				s("ifmain", {
					t({ "def main():", "    pass", "", "if __name__ == '__main__':", "    main()" }),
					i(0),
				}),

				--- creats a class with __init__
				s("classc", {
					t("class "),
					i(1, "ClassName"),
					t({ ":", "    def __init__(self):", "        pass" }),
					i(0),
				}),
				-- try/except
				s("tryc", {
					t({ "try:", "    " }),
					i(1, "pass"),
					t({ "", "except " }),
					i(2, "Exception"),
					t({ " as e:", "    " }),
					i(3, "pass"),
					i(0),
				}),

				-- try/except/finally
				s("tryfin", {
					t({ "try:", "    " }),
					i(1, "pass"),
					t({ "", "except " }),
					i(2, "Exception"),
					t({ " as e:", "    " }),
					i(3, "pass"),
					t({ "", "finally:", "    " }),
					i(4, "pass"),
					i(0),
				}),

				-- list[...]
				s("tlist", {
					i(1, "list"),
					t(":"),
					t("list["),
					i(2, "int"),
					t("]"),
					t("=["),
					i(3),
					t("]"),
					i(0),
				}),

				-- dict[str, ...]
				s("tdict", {
					i(1, "dict"),
					t(":"),
					t("dict["),
					i(2, "str"),
					t(", "),
					i(3, "int"),
					t("]"),
					t("={"),
					i(4),
					i(0),
					t("}"),
				}),

				-- tuple[...]
				s("ttup", {
					t("tuple["),
					i(1, "int"),
					t("]"),
					i(0),
				}),
			})

			--- C Snippets.
			ls.add_snippets("c", {
				--- boilerplate Starter code.
				s("boiler", {
					t({ "#include <stdio.h>", "int main() {", "" }),
					i(1),
					t({ "", "return 0;", "}" }),
				}),

				s("forl", {
					t("for ( int i = "),
					i(1),
					t("; i "),
					i(2, "<"),
					t("; i++ ) {"),
					i(3),
					t("}"),
					i(0),
				}),
				s("pri", {
					t('printf("'),
					i(1),
					t('", '),
					i(2),
					t(");"),
					i(0),
				}),
			})
		end,
	},
}
