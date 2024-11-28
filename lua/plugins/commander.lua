local live_grep_with_cw = function()
	local live_grep = require( "telescope.builtin" ).live_grep

	vim.fn.system( "git rev-parse --is-inside-work-tree" )
	local is_git_repo = vim.v.shell_error == 0

	if not is_git_repo then
		return live_grep()
	end

	local dot_git_path = vim.fn.finddir( ".git", ".;" )
	if dot_git_path == "" then
		dot_git_path = vim.fn.findfile( ".git", ".;" )
	end
	local git_root = vim.fn.fnamemodify( dot_git_path, ":h" )

	local handle = io.popen( "cd " .. git_root .. " && cmake --preset $(cat builddir/current_preset) -N | rg CW_BASE_DIR | sed -E 's/.*\\\"(.*)\\\".*/\\1/g'" )
	assert(handle)
	local cw_dir = handle:read("*l")
	handle:close()

	if cw_dir == "" then
		live_grep()
	end

	live_grep({
		search_dirs = { git_root, cw_dir },
		max_results = 200,
	})
end


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
		{ desc = "Find",					cmd = live_grep_with_cw, },
		{ desc = "Blame",					cmd = "<CMD>Gitsigns toggle_current_line_blame<CR>", },
		{ desc = "Marks",					cmd = "<CMD>Telescope marks<CR>", },
		{ desc = "DAP UI",					cmd = "<CMD>lua require('dapui').toggle()<CR>", },
		{ desc = "Trouble",					cmd = "<CMD>Trouble diagnostics<CR>" },
		{ desc = "CPPRef",					cmd = "<CMD>CPPMan<CR>" },
		{ desc = "TODO",					cmd = "<CMD>Dooing<CR>" }
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
