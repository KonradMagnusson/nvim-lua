local function setup()
	local set_map = require("qnrd-utils").set_map

	do -- Basic text navigation
		set_map( "", "j", "h" )
		set_map( "", "k", "j" )
		set_map( "", "l", "k" )
		set_map( "", "ö", "l" )
		set_map( "", "h", "0" )
		set_map( "", "ä", "$" )
		--
		-- scrolling. Effectively scrolls buffer while keeping the cursorline fixed in the window
		set_map( "n", "<C-k>", "10<C-e>10k", { remap = true, nowait = true } )
		set_map( "n", "<C-l>", "10<C-y>10l", { remap = true, nowait = true } )
		set_map( "n", "<C-A-k>", "<C-e>k", { remap = true, nowait = true } )
		set_map( "n", "<C-A-l>", "<C-y>l", { remap = true, nowait = true } )
	end

	do -- Window navigation
		set_map( "", "<C-Left>", "<C-w>h" )
		set_map( "", "<C-Down>", "<C-w>j" )
		set_map( "", "<C-Up>", "<C-w>k" )
		set_map( "", "<C-Right>", "<C-w>l" )
	end

	do -- quickfix
		set_map( "n", "cn", ":try | cnext | catch | cfirst | catch | endtry<CR>" )
		set_map( "n", "cN", ":try | cprev | catch | clast | catch | endtry<CR>" )
		set_map( "n", "cc", ":cexpr [] | cclose<CR>" )
	end

	do -- misc
		-- clear hlsearch
		set_map( "n", "<Leader>3", ":noh<CR>" )

		-- clear trailing whitespace
		set_map( "n", "<Leader>w", ":%s/\\s\\+$<CR>" )

		-- yank/paste to/from quoteplus ( system clipboard )
		set_map( "", "<Leader>y", '"+y' )
		set_map( "", "<Leader>p", '"+p' )

		set_map( "n", "<Leader>df", vim.diagnostic.open_float )
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
		set_map( "n", "<Leader>f", ToggleTabSplit )
	end
end

return {
	dir = vim.fn.stdpath( "config" ) .. "/lua/plugins/core.mappings",
	name = "core.mappings",
	lazy = false,
	priority = 3,
	init = setup
}
