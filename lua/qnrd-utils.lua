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

M.autocmd = vim.api.nvim_create_autocmd

return M
