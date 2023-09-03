return {
	"folke/neodev.nvim",

	opts = {},

	config = function()
		local lspconfig = require('lspconfig')

		lspconfig.lua_ls.setup({
		  settings = {
			Lua = {
			  completion = {
				callSnippet = "Replace"
			  }
			}
		  }
		})
	end
}
