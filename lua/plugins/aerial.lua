return {
	'stevearc/aerial.nvim',

	tag = "v1.2.0",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},

	opts = {
		open_automatic = false,
		backends = { "treesitter", "lsp", "markdown"},

		layout = {
			max_width = { 40, 0.2 },
			width = nil,
			min_width = 10,
			win_opts = {},
			default_direction = "prefer_left",
			placement = "edge",
			resize_to_content = true,
			preserve_equality = false,
		},

		keymaps = {
			["?"] = "actions.show_help",
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.jump",
			["<2-LeftMouse>"] = "actions.jump",
			["<C-v>"] = "actions.jump_vsplit",
			["<C-s>"] = "actions.jump_split",
			["p"] = "actions.scroll",
			["<C-k>"] = "actions.down_and_scroll",
			["<C-l>"] = "actions.up_and_scroll",
			["{"] = "actions.prev",
			["}"] = "actions.next",
			["[["] = "actions.prev_up",
			["]]"] = "actions.next_up",
			["q"] = "actions.close",
			["o"] = "actions.tree_toggle",
			["za"] = "actions.tree_toggle",
			["O"] = "actions.tree_toggle_recursive",
			["zA"] = "actions.tree_toggle_recursive",
			["ö"] = "actions.tree_open",
			["zo"] = "actions.tree_open",
			["Ö"] = "actions.tree_open_recursive",
			["zO"] = "actions.tree_open_recursive",
			["j"] = "actions.tree_close",
			["zc"] = "actions.tree_close",
			["J"] = "actions.tree_close_recursive",
			["zC"] = "actions.tree_close_recursive",
			["zr"] = "actions.tree_increase_fold_level",
			["zR"] = "actions.tree_open_all",
			["zm"] = "actions.tree_decrease_fold_level",
			["zM"] = "actions.tree_close_all",
			["zx"] = "actions.tree_sync_folds",
			["zX"] = "actions.tree_sync_folds",
		},
		autojump = false,
		manage_folds = auto,
		link_folds_to_tree = true,
		link_tree_to_folds = true,
		guides = {
			mid_item = "├─",
			last_item = "╰─",
			nested_top = "│ ",
			whitespace = "  ",
		},
		treesitter = {
			-- How long to wait (in ms) after a buffer change before updating
			update_delay = 300,
			-- Experimental feature to navigate to symbol names instead of the declaration
			-- See https://github.com/stevearc/aerial.nvim/issues/279
			-- If no bugs are reported for a time this will become the default
			experimental_selection_range = false,
		},

		markdown = {
			-- How long to wait (in ms) after a buffer change before updating
			update_delay = 300,
		},

		man = {
			-- How long to wait (in ms) after a buffer change before updating
			update_delay = 300,
		},
	}
}
