return {
	"monkoose/neocodeium",
	enabled = vim.g.neo_codeium,
	event = "BufReadPre",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()
		vim.keymap.set("i", "<A-f>", neocodeium.accept)
	end,
}
