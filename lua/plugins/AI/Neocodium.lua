return {
	"monkoose/neocodeium",
	event = "BufReadPre",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()
		vim.keymap.set("i", "<A-f>", neocodeium.accept)
	end,
}
