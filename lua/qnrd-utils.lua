local M = {}

M.__set_map = function( mode, keys, mapping, opts )
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



M.__prev_maps = {}
M.__maps = {}

M.make_map_middlehand = function( who )
	M.__maps[who] = {}
	return function( mode, keys, mapping, opts )
		table.insert( M.__maps[who], { mode, keys, mapping, opts } )
	end
end

M.__update_maps = function()
		-- purge old
		if M.__prev_maps then
			for who, entries in pairs( M.__prev_maps ) do
				for _, entry in pairs( entries ) do
					local mode, keys, _, _ = unpack( entry )
					vim.notify( "unmapping " .. keys )
					pcall( vim.keymap.del, mode, keys )
				end
			end
		end

		M.__prev_maps = {}

		-- map new
		if M.__maps then
			for who, entries in pairs( M.__maps ) do
				M.__prev_maps[who] = {}
				for _, entry in pairs( entries ) do
					local mode, keys, mapping, opts = unpack( entry )
					--vim.notify( "mapping " .. keys )
					M.__set_map( mode, keys, mapping, opts )
					table.insert( M.__prev_maps[who], { mode, keys, mapping, opts } )
				end
			end
		end
end

M.autocmd( { "User" }, {
	pattern = "Remap",
	callback = M.__update_maps
} )

M.autocmd( { "VimEnter" }, {
	callback = function() M.__update_maps() end
} )


M.spec_mtimes = {}

return M
