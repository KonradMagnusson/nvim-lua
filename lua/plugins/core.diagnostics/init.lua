local function setup( opts )
	vim.fn.sign_define( 'DiagnosticSignError', { text='', texthl='DiagnosticSignError', numhl='DiagnosticSignError', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignWarn',  { text='', texthl='DiagnosticSignWarn', numhl='DiagnosticSignWarn', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignInfo',  { text='', texthl='DiagnosticSignInfo', numhl='DiagnosticSignInfo', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignHint',  { text='🯈', texthl='DiagnosticSignHint', numhl='DiagnosticSignHint', linehl='' } )

	-- The TS-based diagnostics below are originally from /r/robertogrows's post:  https://www.reddit.com/r/neovim/comments/1ir069p/treesitter_diagnostics/
	-- Modified by me (github.com/KonradMagnusson) to suit my needs and preferences.

	--- language-independent query for syntax errors and missing elements
	local error_query = vim.treesitter.query.parse('query', '(ERROR) @a')
	local namespace = vim.api.nvim_create_namespace('treesitter.diagnostics')

	--- @param args vim.api.keyset.create_autocmd.callback_args
	local function diagnose(args)
		-- avoid issues with short-lived buffers and eager pressing of keybinds...
		if not vim.api.nvim_buf_is_valid( args.buf ) then
			return
		end

		if not vim.diagnostic.is_enabled({bufnr = args.buf}) then
			return
		end

		-- don't diagnose strange stuff
		if vim.bo[args.buf].buftype ~= '' then
			return
		end

		-- don't fight language servers, please
		if #vim.lsp.get_clients({ bufnr = args.buf }) > 0 then
			return
		end


		-- pcall, because get_parser will fail if there's no treesitter parser for the current buftype's language
		local has_parser, parser = pcall( function() return vim.treesitter.get_parser(args.buf, nil, { error = false }) end )
		if not has_parser or not parser then
			return
		end

		local diagnostics = {}
		parser:for_each_tree(function(tree, ltree)
			-- only process trees containing errors
			if tree:root():has_error() then
				for _, node in error_query:iter_captures(tree:root(), args.buf) do
					local lnum, col, end_lnum, end_col = node:range()

					-- collapse nested syntax errors that occur at the exact same position
					local parent = node:parent()
					if parent and parent:type() == 'ERROR' and parent:range() == node:range() then
						goto continue
					end

					-- clamp large syntax error ranges to just the line to reduce noise
					if end_lnum > lnum then
						end_lnum = lnum + 1
						end_col = 0
					end

					--- @type vim.Diagnostic
					local diagnostic = {
						source = 'treesitter',
						lnum = lnum,
						end_lnum = end_lnum,
						col = col,
						end_col = end_col,
						message = '',
						code = string.format('%s-syntax', ltree:lang()),
						bufnr = args.buf,
						namespace = namespace,
						severity = vim.diagnostic.severity.ERROR
					}
					if node:missing() then
						diagnostic.message = string.format('missing `%s`', node:type())
					else
						diagnostic.message = 'error'
					end

					-- add context to the error using sibling and parent nodes
					local previous = node:prev_sibling()
					if previous and previous:type() ~= 'ERROR' then
						local previous_type = previous:named() and previous:type() or string.format('`%s`', previous:type())
						diagnostic.message = diagnostic.message .. ' after ' .. previous_type
					end

					if parent and parent:type() ~= 'ERROR' and (previous == nil or previous:type() ~= parent:type()) then
						diagnostic.message = diagnostic.message .. ' in ' .. parent:type()
					end

					table.insert(diagnostics, diagnostic)
					::continue::
				end
			end
		end)
		vim.diagnostic.set(namespace, args.buf, diagnostics)
	end

	local autocmd_group = vim.api.nvim_create_augroup('editor.treesitter', { clear = true })

	vim.api.nvim_create_autocmd({ 'FileType', 'TextChanged', 'InsertLeave' }, {
		desc = 'treesitter diagnostics',
		group = autocmd_group,
		callback = vim.schedule_wrap(diagnose),
	})
end

return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.diagnostics",
	name = "core.diagnostics",
	lazy = false,
	priority = 4,
	init = setup
}
