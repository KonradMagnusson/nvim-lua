local function setup()
	require("ouroboros").setup({})

	local utils = require("qnrd-utils")
	utils.set_map( "n", "go", ":Ouroboros<CR>" )
end

return {
	"jakemason/ouroboros.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = setup
}
