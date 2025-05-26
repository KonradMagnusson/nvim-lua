local function setup()
	require("ouroboros").setup({})

	local set_map = require("qnrd-utils").make_map_middlehand( "ouroboros" )
	set_map( "n", "go", ":Ouroboros<CR>" )
end

return {
	"jakemason/ouroboros.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	config = setup
}
