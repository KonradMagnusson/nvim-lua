local function setup()
	local function set_map( mode, keys, mapping, opts )
		vim.api.nvim_set_keymap( mode, keys, mapping, opts or { noremap = true } )
	end

	do -- Basic text navigation
		set_map( "", "j", "h" )
		set_map( "", "k", "j" )
		set_map( "", "l", "k" )
		set_map( "", "ö", "l" )
		set_map( "", "h", "0" )
		set_map( "", "ä", "$" )

		-- scrolling. Effectively scrolls buffer while keeping the cursorline fixed in the window
		set_map( "n", "<C-K>", "10<C-E>10k", { noremap = false, nowait = true } )
		set_map( "n", "<C-L>", "10<C-Y>10l", { noremap = false, nowait = true } )
		set_map( "n", "<C-A-K>", "<C-E>k", { noremap = false, nowait = true } )
		set_map( "n", "<C-A-L>", "<C-Y>l", { noremap = false, nowait = true } )
	end

	do -- Window navigation
		set_map( "", "<C-left>", "<C-w>h" )
		set_map( "", "<C-down>", "<C-w>j" )
		set_map( "", "<C-up>", "<C-w>k" )
		set_map( "", "<C-right>", "<C-w>l" )
	end

	do -- quickfix
		set_map( "n", "cn", ":try | cnext | catch | cfirst | catch | endtry<CR>" )
		set_map( "n", "cN", ":try | cprev | catch | clast | catch | endtry<CR>" )
		set_map( "n", "cc", ":cexpr [] | cclose<CR>" )
	end

	do -- misc
		-- clear hlsearch
		set_map( "n", "<leader>3", ":noh<CR>" )

		-- clear trailing whitespace
		set_map( "n", "<Leader>w", ":%s/\\s\\+$<CR>" )

		-- yank/paste to/from quoteplus ( system clipboard )
		set_map( "", "<leader>y", '"+y' )
		set_map( "", "<leader>p", '"+p' )

		set_map( "n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>" )
		set_map( "n", "<A-i>", ":Inspect<CR>" )

		-- remember, switching to your alternate file is always faster than reloading
		set_map( "n", "<C-q>", "<C-6>" )


		-- ( toggle ) open current buffer in a new full screen tab, or close it if one is open
		-- I don't otherwise use tabs, so I can rely on only one open tab being the defualt
		ToggleTabSplit = function()
			if tonumber( vim.fn.tabpagenr() ) == 1 then
				vim.cmd( "tab split" )
			else
				vim.api.nvim_win_close( 0, false )
			end
		end
		set_map( "n", "<leader>f", ":lua ToggleTabSplit()<CR>" )
	end
end

return {
	dir = vim.fn.stdpath( "config" ) .. "/lua/plugins/core.mappings",
	name = "core.mappings",
	lazy = false,
	priority = 3,
	init = setup
}
