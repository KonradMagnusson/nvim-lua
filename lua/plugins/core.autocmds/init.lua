local function setup()
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
		command = "silent !$(git rev-parse --show-toplevel)/external_tools/llvm-clang-format/clang-format -i %:p"
	})

	-- enter insert mode when switching to a terminal window
	au({ "BufWinEnter", "WinEnter" }, {
		group = buffer_group,
		pattern = "term://*",
		command = "startinsert",
	})

	au("WinEnter", {
		group = buffer_group,
		callback = function(ev)
			if vim.bo[0].filetype == "notify" then
				vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes( "<C-W><C-W>", true, false, true ), "n", true )
			end
		end
	})

	au( "fileType", {
		pattern = "cpp",
		callback = function(ev)
			vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
			vim.api.nvim_buf_set_option(0, "matchpairs", "(:),{:},[:],<:>" )
		end
	})

	au( "User", {
		pattern = "NinjaBuildStarted",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine("󰣪  Building...")
		end
	})
	au( "User", {
		pattern = "NinjaBuildFinished",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine("✓  Built")
			local has_neotest, neotest = pcall(require, "neotest")
			if has_neotest then
				neotest.run.run_last()
			end
		end
	})
	au( "User", {
		pattern = "NinjaBuildFailed",
		callback = function(ev)
			vim.opt.statusline = vim.g.BuildStatusLine(" BUILD FAILED!")
		end
	})

	-- auto hide inlay hints
	au({ "CursorMoved", "InsertEnter" }, {
		callback = function( ev )
			vim.lsp.inlay_hint.enable(false)
		end
	})

	-- semantic highlight for non-const member functions
	au( "LspTokenUpdate" , {
		callback = function( ev )
			local token = ev.data.token
			if token.type == "method" and not token.modifiers.readonly then
				vim.lsp.semantic_tokens.highlight_token( token, ev.buf, ev.data.client_id, "Mutable", { priority = 120 } )
			end
		end
	})

	-- dynamic scrolloff based on window height
	au( {"WinResized", "WinNew", "WinEnter"}, {
		callback = function(ev)
			local window_height = vim.api.nvim_win_get_height( 0 )
			local offset = math.floor( window_height / 6 )
			vim.api.nvim_buf_set_option( 0, "scrolloff", offset )
		end
	})


	au( { "FileType" }, {
		pattern="cpp",
		callback = function( _ )
			local namespace = vim.api.nvim_create_namespace( "_CurrentScope" )
			local ts_utils = require("nvim-treesitter.ts_utils")
			local cur_scope_group = vim.api.nvim_create_augroup("_CurrentScope", { clear = true })


			au( { "CursorMoved" }, { -- yo dawg!
				group = cur_scope_group,
				callback = function( _ )
					vim.api.nvim_buf_clear_namespace( 0, namespace, 0, -1 )
					if vim.bo[0].ft ~= "cpp" then
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
					})

				end
			})
		end
	})

end


return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.autocmds",
	name = "core.autocmds",
	lazy = false,
	priority = 100,
	config = setup
}


