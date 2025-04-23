local function setup()
	local au = require( "qnrd-utils" ).autocmd

	-- toggle relativenumber / norelativenumber based on mode
	au( { "InsertEnter" }, {
		command = "set norelativenumber",
	} )
	au( { "InsertLeave" }, {
		command = "set relativenumber",
	} )

	-- dynamic scrolloff based on window height
	au( { "WinResized", "WinNew", "WinEnter" }, {
		callback = function( _ )
			local window_height = vim.api.nvim_win_get_height( 0 )
			local offset = math.floor( window_height / 6 )
			vim.api.nvim_set_option_value( "scrolloff", offset, { scope = "local" } )
		end
	} )

	-- makefiles require tabs
	au( { "FileType" }, {
		pattern = "make",
		command = "setlocal ts=4 sts=4 sw=4 noexpandtab",
	} )

	-- hack - make help window vertical when it opens
	au( { "FileType" }, {
		pattern = "help",
		command = "wincmd L",
	} )

	-- yaml requires spaces
	au( { "FileType" }, {
		pattern = "yaml",
		command = "setlocal ts=2 sts=2 sw=2 expandtab",
	} )

	-- disallow focusing notifications
	au( { "WinEnter" }, {
		callback = function( _ )
			if vim.bo.ft == "notify" then
				-- focusing a notification kicks focus on to the next window
				vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes( "<C-W><C-W>", true, false, true ), "n", true )
			end
		end
	} )

	-- auto hide inlay hints
	au( { "CursorMoved", "InsertEnter" }, {
		callback = function( _ )
			vim.lsp.inlay_hint.enable( false )
		end
	} )

	-- highlight trailing whitespace
	au( { "BufEnter", "FileType", "UIEnter", "WinEnter" }, {
		pattern = "*",
		callback = function( _ )
			local ignored = { "TelescopePrompt", "TelescopeResults", "help", "alpha", "qf", "markdown", "notify", "lazy" }
			if vim.tbl_contains( ignored, vim.bo.ft ) then
				vim.cmd( [[match]] )
				return
			end

			vim.cmd( [[match ErrorMsg /\s\+$/]] )
		end
	} )

	-- generic C++ things
	au( { "FileType" }, {
		pattern = "cpp",
		callback = function( _ )
			vim.api.nvim_set_option_value( "commentstring", "// %s", { scope = "local" } )
			-- < and > are not in matchpairs by default 🤷
			vim.api.nvim_set_option_value( "matchpairs", "(:),{:},[:],<:>" , { scope = "local" } )
		end
	} )
	-- semantic highlight for non-const member functions
	au( { "LspTokenUpdate" }, {
		callback = function( ev )
			local token = ev.data.token
			if token.type == "method" and not token.modifiers.readonly then
				vim.lsp.semantic_tokens.highlight_token( token, ev.buf, ev.data.client_id, "Mutable", { priority = 120 } )
			end
		end
	} )


	-- Highlight current scope.
	-- Deeply nested code becomes very difficult to read.
	-- When working in a codebase that for some reason avoids early outs and the use of 'continue', this has proven very helpful.
	au( { "FileType" }, {
		pattern = "cpp",
		callback = function( _ )
			local namespace = vim.api.nvim_create_namespace( "_CurrentScope" )
			local cur_scope_group = vim.api.nvim_create_augroup( "_CurrentScope", { clear = true } )

			au( { "CursorMoved" }, { -- yo dawg!
				group = cur_scope_group,
				callback = function( _ )
					vim.api.nvim_buf_clear_namespace( 0, namespace, 0, -1 )
					if vim.bo.ft ~= "cpp" then
						return
					end

					-- find current scope
					local its = 0
					local node = vim.treesitter.get_node()
					while node and its < 10 and node:type() ~= "compound_statement" do
						node = node:parent()
						its = its + 1
					end
					if not node then return end

					local first_line, _, last_line, _ = node:range()
					vim.api.nvim_buf_set_extmark( 0, namespace, first_line, 0, {
						end_row = math.min( last_line + 1, vim.api.nvim_buf_line_count( 0 ) ), -- + 1 (and end_col = 0) to achieve a rectangular highlight
						end_col = 0,
						hl_group = "CurrentScope",
						hl_eol = true,
						priority = 75, -- lower than default (100) so as to not fight e.g. LspReferenceRead/Write highlights
					} )
				end
			} )

		end
	} )

	-- basically emulate rrethy/vim-illuminate, but only when a language server is attached
	local lsp_group = vim.api.nvim_create_augroup( "LspAu", { clear = true } )
	au( { "LspAttach" }, {
		group = lsp_group,
		callback = function( _ )
			vim.g._prev_updatetime = vim.opt.updatetime
			vim.opt.updatetime = 10
			au( { "CursorMoved" }, { group = lsp_group, callback = function( _ ) vim.lsp.buf.clear_references() end } )
			au( { "CursorHold" }, { group = lsp_group, callback = function( _ ) vim.lsp.buf.document_highlight() end } )
		end
	} )
	au( { "LspDetach" }, {
		callback = function( _ )
			vim.opt.updatetime = vim.g._prev_updatetime
			vim.g._prev_updatetime = nil
			vim.lsp.buf.clear_references()
			vim.api.nvim_clear_autocmds( { group = lsp_group } )
		end
	} )

end


return {
	dir = vim.fn.stdpath( "config" ) .. "/lua/plugins/core.autocmds",
	name = "core.autocmds",
	lazy = false,
	priority = 100,
	config = setup
}
