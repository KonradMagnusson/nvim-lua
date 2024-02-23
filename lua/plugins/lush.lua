return {
	"rktjmp/lush.nvim",
	init = function()
		local lush = require("lush")
		lush(require("colors.qnrdbox"))
	end
}
