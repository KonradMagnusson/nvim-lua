local function setup()
	require("ouroboros").setup({})

	local utils = require("qnrd-utils")
	utils.set_buf_map("n", "go", ":Ouroboros<CR>", 0, { noremap = true, silent = true })
end

return {
	"jakemason/ouroboros.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = setup
}
