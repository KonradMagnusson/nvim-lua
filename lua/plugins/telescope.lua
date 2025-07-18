local function setup()
	require("telescope").setup()

	local utils = require("qnrd-utils")

	utils.set_map("n", "<C-p>", function() require('telescope.builtin').find_files({ search_dirs = vim.g.qnrd_get_project_dirs() }) end )
	utils.set_map("n", "<A-p>", ":Telescope commander<CR>")
end


return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep"
	},
	lazy = false,
	priority = 75,
	config = setup
}
