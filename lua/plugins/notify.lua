return {
	"rcarriga/nvim-notify",

	dependencies = { "rktjmp/lush.nvim" },

	config = function()
		vim.notify = require("notify")
		vim.notify.setup({
			max_width = 200,
			max_height = 200,
			on_open = function() end,
			on_close = function() end,
			background_colour = "NotifyBackground",
			fps = 30,
			icons = {
			  DEBUG = "",
			  ERROR = "",
			  INFO = "",
			  TRACE = "✎",
			  WARN = ""
			},
			level = 1,
			minimum_width = 50,
			render = "compact",
			stages = "fade_in_slide_out",
			timeout = 5000,
			top_down = true
		  })
	end
}
