return {
	"nvim-treesitter/nvim-treesitter",

	dependencies = {
		"rcarriga/nvim-notify",
		"nvim-treesitter/playground",
	},

	config = function()
		local ts_update = require("nvim-treesitter.install").update({with_sync = true})
		ts_update()

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua", "vim", "vimdoc", "query", "c", "cpp", "cwscript", "python"
			},
			sync_install = false,

			highlight = { enable = true },
			indent = {
				enable = true,
				disable = { "python" }
			},
		})
	end
}
