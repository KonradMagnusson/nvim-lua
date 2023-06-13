require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua", "vim", "vimdoc", "query",
		"c", "cpp",
	},
	sync_install = false,

	highlight = { enable = true },
	playground = {
		enable = true,
		updatetime = 25,
	},
})
