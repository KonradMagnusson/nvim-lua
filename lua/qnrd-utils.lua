local M = {}

M.set_map = function( mode, keys, mapping, opts )
	vim.keymap.set(
		mode,
		keys,
		mapping,
		opts or { noremap = true, silent = true }
	)
end

M.set_buf_map = function( mode, keys, mapping, buf, opts )
	default_opts = {
		buffer = 0,
		noremap = true,
		silent = true
	}
	opts = vim.tbl_extend( "force", default_opts, opts )
	if buf then
		opts.buffer = buf
	end

	vim.keymap.set(
		mode,
		keys,
		mapping,
		opts
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
