return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			workspace = {
				checkThirdParty = false,
				maxPreload = 100,
				preloadFileSize = 100,
				ignoreDir = {
					"some_folder_to_ignore",
					"another_folder",
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
