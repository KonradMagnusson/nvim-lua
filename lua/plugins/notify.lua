return {
	"rcarriga/nvim-notify",

	dependencies = { "rktjmp/lush.nvim" },

	config = function() vim.notify = require("notify") end
}
