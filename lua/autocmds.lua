local file_type_group = vim.api.nvim_create_augroup("fileTypeCommands", { clear = true })
local buffer_group = vim.api.nvim_create_augroup("bufCommands", { clear = true })

-- toggle relativenumber / norelativenumber based on mode
vim.api.nvim_create_autocmd("InsertEnter", {
	command = "set norelativenumber",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	command = "set relativenumber",
})

-- makefiles require tabs
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "make",
	command = "setlocal ts=4 sts=4 sw=4 noexpandtab",
})

-- yaml requires spaces
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "yaml",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

-- enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	group = buffer_group,
	pattern = "term://*",
	command = "startinsert",
})


-- workaround to get diff mode things to work in git mergetool/difftool
vim.api.nvim_create_autocmd( {"VimEnter"}, {
	callback = function(ev)
		if vim.api.nvim_win_get_option(0, "diff") then
			require("diff")
		end
	end
})


vim.api.nvim_create_autocmd( "fileType", {
	pattern = "cpp",
	callback = function(ev)
		vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
	end
})
