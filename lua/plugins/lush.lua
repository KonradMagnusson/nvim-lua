return {
	"rktjmp/lush.nvim",
	priority = 400,
	init = function()
		local colorscheme = "qnrdbox"

		local lush = require("lush")
		lush( require("colors." .. colorscheme) )

		local utils = require("qnrd-utils")
		utils.autocmd( "BufRead", {
			pattern = "*.lua",
			callback = function(ev)
				if vim.fn.expand("%:t:r") == colorscheme then
					lush.ify()
				end
			end
		})

	end
}
