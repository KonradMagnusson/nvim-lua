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

-- vertical help
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "help",
	command = "wincmd L",
})

-- yaml requires spaces
vim.api.nvim_create_autocmd("fileType", {
	group = file_type_group,
	pattern = "yaml",
	command = "setlocal ts=2 sts=2 sw=2 expandtab",
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
	group = file_type_group,
	pattern = "*.gui",
	command = "setf text",
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {"*.cpp", "*.h", "*.inl" };
	command = "silent !/home/qnrd/bin/clang-format -i %:p",
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

vim.api.nvim_create_autocmd("InsertEnter", {
	command = "ClangdDisableInlayHints",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	command = "ClangdSetInlayHints",
})

--[[
vim.api.nvim_create_autocmd( "LspTokenUpdate", {
	callback = function( args )
		local token = args.data.token
		if token.type ~= "class" then
			return
		end

		local unnamed_endings = {
			",", "&,", "*,", "&&,", "**,",
			" )", "& )", "* )", "&& )", "** )",
		}

		local tail = vim.api.nvim_buf_get_text( args.buf, token.line, token.end_col + 0, token.line, 500, {})[1]
		for k, ending in pairs( unnamed_endings ) do
			if tail == ending then
				vim.lsp.semantic_tokens.highlight_token( token, args.buf, args.data.client_id, "InlayHint")
					return
			end
		end
	end
})
----]]




vim.api.nvim_create_autocmd( {"WinResized", "WinNew", "WinEnter"}, {
	callback = function(ev)
		local window_height = vim.api.nvim_win_get_height( 0 )
		local offset = math.floor( window_height / 6 )
		vim.api.nvim_buf_set_option( 0, "scrolloff", offset )
	end
})
