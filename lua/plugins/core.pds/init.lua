local function setup()
	local utils = require("qnrd-utils")

	-- pretend cw gui files are regular script files
	utils.autocmd({"BufNewFile", "BufRead"}, {
		pattern = "*.gui",
		command = "setf text",
	})
	utils.autocmd({"BufNewFile", "BufRead"}, {
		pattern = "*.tok",
		command = "setf tok",
	})

	-- (local) clang-format on write
	utils.autocmd("BufWritePost", {
		pattern = {"*.cpp", "*.h", "*.inl" },
		command = "silent !$(git rev-parse --show-toplevel)/external_tools/llvm-clang-format/clang-format -i %:p"
	})


	vim.g.qnrd_get_workspace = function()
		local handle = io.popen([[pwd | sed 's/.*proj\/\(.*\)\/.*/\1/']])
		assert(handle)
		local workspace = handle:read("*l")
		handle:close()
		return workspace
	end

	vim.g.qnrd_get_project_dirs = function()
		vim.fn.system( "git rev-parse --is-inside-work-tree" )
		local is_git_repo = vim.v.shell_error == 0
		if not is_git_repo then
			return { "." }
		end

		local dot_git_path = vim.fn.finddir( ".git", ".;" )
		if dot_git_path == "" then -- implies secondary worktree; look for a .git /file/ instead
			dot_git_path = vim.fn.findfile( ".git", ".;" )
		end
		local git_root = vim.fn.fnamemodify( dot_git_path, ":h" )
		local cw_dir =  git_root .. "/../cw"

		if not vim.fn.isdirectory(cw_dir) then
			return { "." }
		end

		return { ".", cw_dir }
	end


	utils.set_map("n", "<leader>vk", ':silent !vkill<CR>')
end

return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.pds",
	name = "core.pds",
	priority = 3,
	init = setup
}
