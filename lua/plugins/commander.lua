local init_commander = function()
	local commander = require("commander")
	commander.setup({
		integration = {
			telescope = {
				enable = true,
				theme = require("telescope.themes").commander
			}
		},
		components = { "DESC" }
	})
	commander.add({
		{ desc = "Find",					cmd = function() require('telescope.builtin').live_grep( { search_dirs = vim.g.qnrd_get_project_dirs() } ) end },
		{ desc = "Blame",					cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>" },
		{ desc = "Marks",					cmd = "<CMD>Telescope marks<CR>", },
		{ desc = "DAP UI",					cmd = function() require('dapui').toggle() end },
		{ desc = "TODO",					cmd = "<CMD>Dooing<CR>" },
		{ desc = "Test",					cmd = "<CMD>Neotest summary toggle<CR>" },
		{ desc = "Smear",					cmd = function() require("smear_cursor").enabled = not require("smear_cursor").enabled end },
		{ desc = "Undo",					cmd = "<CMD>UndotreeToggle<CR>"},
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
