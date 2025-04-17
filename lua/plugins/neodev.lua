return {
	"folke/neodev.nvim",

	dependencies = {
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("neodev").setup({})

		local lspconfig = require('lspconfig')

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						enable = true,
						callSnippet = "Both",
						displayContext = 3
					},
					hint = {
						enable = true,
						arrayIndex = "Enable",
						setType = true
					}
				}
			}
		})
	end
}
