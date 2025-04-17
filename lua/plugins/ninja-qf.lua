local function setup()
	opts = {
		qf_format = "{type:=7}|{file:>35}|l{line:>5}|c{col:>3}|  {text}"
	}
	require("ninja-qf").setup( opts )

	local utils = require("qnrd-utils")
	utils.set_map("", "<leader>B", ":silent !touch /tmp/.build_token<CR>" )

	local au = utils.autocmd
	au( "User", {
		pattern = "NinjaBuildStarted",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine("󰣪  Building...")
		end
	})
	au( "User", {
		pattern = "NinjaBuildFinished",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine("✓  Built")
			local has_neotest, neotest = pcall(require, "neotest")
			if has_neotest then
				neotest.run.run_last()
			end
		end
	})
	au( "User", {
		pattern = "NinjaBuildFailed",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine(" BUILD FAILED!")
		end
	})
end

return {
	"konradmagnusson/ninja-qf",
	ft = "cpp",
	config = setup
}
