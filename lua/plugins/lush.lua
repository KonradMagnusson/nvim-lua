return {
	"rktjmp/lush.nvim",
	priority = 400,
	init = function()
		local lush = require("lush")
		lush(require("colors.qnrdbox"))
	end
}
