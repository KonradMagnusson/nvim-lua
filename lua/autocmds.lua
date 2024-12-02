local au = vim.api.nvim_create_autocmd

local file_type_group = vim.api.nvim_create_augroup("fileTypeCommands", { clear = true })
local buffer_group = vim.api.nvim_create_augroup("bufCommands", { clear = true })

-- toggle relativenumber / norelativenumber based on mode
au("InsertEnter", {
	command = "set norelativenumber",
})
au("InsertLeave", {
	command = "set relativenumber",
})

-- makefiles require tabs
au("fileType", {
	group = file_type_group,
	pattern = "make",
	command = "setlocal ts=4 sts=4 sw=4 noexpandtab",
})

-- vertical help
au("fileType", {
	group = file_type_group,
	pattern = "help",
	command = "wincmd L",
})

-- yaml requires spaces
au("fileType", {
	group = file_type_group,
	pattern = "yaml",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

-- pretend cw gui files are regular script files
au({"BufNewFile", "BufRead"}, {
	group = file_type_group,
	pattern = "*.gui",
	command = "setf text",
})
au({"BufNewFile", "BufRead"}, {
	group = file_type_group,
	pattern = "*.tok",
	command = "setf tok",
})

-- (local) clang-format on write
au("BufWritePost", {
	pattern = {"*.cpp", "*.h", "*.inl" },
	command = "silent !/home/qnrd/bin/clang-format -i %:p"
})

-- enter insert mode when switching to a terminal window
au({ "BufWinEnter", "WinEnter" }, {
	group = buffer_group,
	pattern = "term://*",
	command = "startinsert",
})


-- diff-specific mappings
au( {"VimEnter"}, {
	callback = function(ev)
		if vim.api.nvim_win_get_option(0, "diff") then
			require("diff")
		end
	end
})


au( "fileType", {
	pattern = "cpp",
	callback = function(ev)
		vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
		vim.api.nvim_buf_set_option(0, "matchpairs", "(:),{:},[:],<:>" )

		-- RPC messages from build system (hacked ninja)
		local addr = "127.0.0.1:48199"
		if pcall( vim.fn.serverstart, addr ) then
			vim.notify( "RPC server listening on " .. addr )
		end
	end
})

-- hide inlay hints in insert mode
au("InsertEnter", {
	command = "ClangdDisableInlayHints",
})
au("InsertLeave", {
	command = "ClangdSetInlayHints",
})

-- dynamic scrolloff based on window height
au( {"WinResized", "WinNew", "WinEnter"}, {
	callback = function(ev)
		local window_height = vim.api.nvim_win_get_height( 0 )
		local offset = math.floor( window_height / 6 )
		vim.api.nvim_buf_set_option( 0, "scrolloff", offset )
	end
})
