require("telescope").setup({
	defaults = {
		--borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},
	},
})

require("telescope").load_extension("command_center")



