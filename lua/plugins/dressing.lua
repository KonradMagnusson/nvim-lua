local init_dressing = function() 
	require("dressing").setup({
		input = {
			border = "single",
			relative = "editor",
		},
		select = {
			backend = { "telescope", "builtin" },
			telescope = require("telescope.themes").get_dropdown({
				borderchars = {
					prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			}),
			builtin = {
				border = "single",
			},
		},
	})
end

return {
	'stevearc/dressing.nvim',

	dependencies = {
		"nvim-telescope/telescope.nvim"
	},
	init = init_dressing
}
