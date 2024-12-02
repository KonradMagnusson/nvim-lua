return {
	"atiladefreitas/dooing",
	dev = true,
	opts = {
		save_path = '/home/qnrd/d/dooing_todos.json',

		-- Window appearance
		window = {
			width = 300,
			height = 30,
			border = 'rounded',
		},

		-- Icons
		icons = {
			pending = '',
			done = '󰱒',
		},

		-- Keymaps
		keymaps = {
			toggle_window = "<leader>td",
			new_todo = "i",
			toggle_todo = "x",
			delete_todo = "d",
			delete_completed = "D",
			close_window = "q",
			toggle_help = "?",
			toggle_tags = "t",
			clear_filter = "c",
			edit_todo = "e",
		},
	}
}
