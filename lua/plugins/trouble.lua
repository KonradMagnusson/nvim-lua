return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		win = {
			position = "right",
			width = 80,
			type = "split"
		},
		filter = {
			severity = vim.diagnostic.severity.ERROR,
		}
	}
}
