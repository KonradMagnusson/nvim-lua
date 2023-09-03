local init_commander = function()
	local commander = require("commander")
	commander.setup({
		integration = {
			telescope = {
				enable = true,
				theme = require("telescope.themes").commander
			}
		}
	})
	commander.add({
		{ desc = "Files",			cmd = "<CMD>Telescope find_files<CR>", },
		{ desc = "Find",			cmd = "<CMD>Telescope live_grep<CR>", },
		{ desc = "Find in Buffer",	cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>", },
		{ desc = "Blame",			cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>", },
		{ desc = "Symbols",			cmd = "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", },
		{ desc = "Quickfix",		cmd = "<CMD>Telescope quickfix<CR>", },
		{ desc = "Trouble",			cmd = "<CMD>TroubleToggle<CR>", },
		{ desc = "Marks",			cmd = "<CMD>BookmarksListAll<CR>", },
		{ desc = "DAP UI",			cmd = "<CMD>lua require('dapui').toggle()<CR>", },
	})
end

return {
	"FeiyouG/commander.nvim",

	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-symbols.nvim"
	},

	init = init_commander
}
