local M = {}

M.set_map = function( mode, keys, mapping, opts )
	vim.api.nvim_set_keymap(
		mode,
		keys,
		mapping,
		opts or { noremap = true, silent = true }
	)
end

M.set_buf_map = function( mode, keys, mapping, buf, opts )
	vim.api.nvim_buf_set_keymap(
		buf or 0,
		mode,
		keys,
		mapping,
		opts or { noremap = true, silent = true }
	)
end

M.get_current_file = function()
	local filepath = debug.getinfo( 2, "S" ).source:sub( 2 )
	local file_sans_ext = filepath:match( "^.*/(.*).lua$" )
	return file_sans_ext
end

M.autocmd = vim.api.nvim_create_autocmd

M.spec_mtimes = {}

return M
