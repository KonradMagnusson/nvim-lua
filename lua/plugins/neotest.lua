local function setup_gtest()
	local lib = require("neotest.lib")

	return require("neotest-gtest").setup({
		root = lib.files.match_root_pattern(
			"CMakePresets.txt",
			"compile_commands.json",
			".clangd",
			"init.lua",
			"init.vim",
			"build",
			"builddir",
			".git"
		),
		debug_adapter = "lldb",
		is_test_file = function(file)
			if string.find( file, "builddir" ) ~= nil then
				return false
			end
			if string.find( file, "bin/" ) ~= nil then
				return false
			end
			return string.find( vim.fs.basename(file), "test" ) ~= nil
		end,
		history_size = 3,
		parsing_throttle_ms = 10,
		mappings = { configure = "C" },
		summary_view = {
			header_length = 80,
			shell_palette = {
				passed = "\27[32m",
				skipped = "\27[33m",
				failed = "\27[31m",
				stop = "\27[0m",
				bold = "\27[1m",
			},
		},
	})
end

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",

		"alfaix/neotest-gtest"
	},
	config = function()
		require("neotest").setup({
			adapters = {
				setup_gtest()
			},
			discovery = {
				concurrent = 4
			},
			output= {
				open = "belowright split"
			},
			summary = {
				open = "topleft vsplit | vertical resize 40",
				mappings = {
					attach = "a",
					clear_marked = "M",
					clear_target = "T",
					debug = "d",
					debug_marked = "D",
					expand = "<CR>",
					expand_all = "e",
					help = "?",
					jumpto = "i",
					mark = "m",
					next_failed = "K",
					output = "o",
					prev_failed = "L",
					run = "r",
					run_marked = "R",
					short = "O",
					stop = "u",
					target = "t",
					watch = "w"
				},
			},
		})
		vim.api.nvim_set_keymap( "n", "<leader>tr", ":Neotest run<CR>", { noremap = true })
		vim.api.nvim_set_keymap( "n", "<leader>ts", ":Neotest summary<CR>", { noremap = true })
		vim.api.nvim_set_keymap( "n", "<leader>to", ":Neotest output<CR>", { noremap = true })
		vim.api.nvim_set_keymap( "n", "<leader>tn", ":Neotest jump next<CR>", { noremap = true })
		vim.api.nvim_set_keymap( "n", "<leader>tp", ":Neotest jump prev<CR>", { noremap = true })
	end
}
