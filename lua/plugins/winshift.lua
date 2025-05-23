return {
	"sindrets/winshift.nvim",
	opts = {
		highlight_moving_win = true,
		focused_hl_group = "Visual",
		moving_win_options = {
			wrap = false,
			cursorline = false,
			cursorcolumn = false,
			colorcolumn = "",
		},
		keymaps = {
			disable_defaults = false,
			win_move_mode = {
				["h"] = "left",
				["j"] = "down",
				["k"] = "up",
				["l"] = "right",
				["H"] = "far_left",
				["J"] = "far_down",
				["K"] = "far_up",
				["L"] = "far_right",
				["<left>"] = "left",
				["<down>"] = "down",
				["<up>"] = "up",
				["<right>"] = "right",
				["<S-left>"] = "far_left",
				["<S-down>"] = "far_down",
				["<S-up>"] = "far_up",
				["<S-right>"] = "far_right",
			},
		},
		window_picker = function()
			return require("winshift.lib").pick_window({
				picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				filter_rules = {
					cur_win = true,
					floats = true,
					filetype = {},
					buftype = {},
					bufname = {},
				},
				filter_func = nil,
			})
		end,
	},
	init = function()
		local set_map = require("qnrd-utils").set_map
		set_map( "n", "<A-j>", ":WinShift left<CR>", { noremap = false })
		set_map( "n", "<A-k>", ":WinShift down<CR>", { noremap = false })
		set_map( "n", "<A-l>", ":WinShift up<CR>", { noremap = false })
		set_map( "n", "<A-ö>", ":WinShift right<CR>", { noremap = false })
	end
}
