local function setup()
	local function set_map( mode, keys, mapping, opts )
		vim.api.nvim_set_keymap( mode, keys, mapping, opts or { noremap = true } )
	end

	-- basics
	set_map("t", "<Esc>", "<C-\\><C-n>")
	set_map("t", "<C-left>", "<Esc><C-w>h", {})
	set_map("t", "<C-down>", "<Esc><C-w>j", {})
	set_map("t", "<C-up>", "<Esc><C-w>k", {})
	set_map("t", "<C-right>", "<Esc><C-w>l", {})
	set_map("", "<C-left>", "<C-w>h")
	set_map("", "<C-down>", "<C-w>j")
	set_map("", "<C-up>", "<C-w>k")
	set_map("", "<C-right>", "<C-w>l")

	set_map("", "j", "h")
	set_map("", "k", "j")
	set_map("", "l", "k")
	set_map("", "ö", "l")
	set_map("", "h", "0")
	set_map("", "ä", "$")

	-- scrolling
	set_map("n", "<C-K>", "10<C-E>10k", {noremap = false, nowait = true })
	set_map("n", "<C-L>", "10<C-Y>10l", {noremap = false, nowait = true })
	set_map("n", "<C-A-K>", "<C-E>k", {noremap = false, nowait = true })
	set_map("n", "<C-A-L>", "<C-Y>l", {noremap = false, nowait = true })


	-- misc
	set_map("n", "<leader>3", ":noh<CR>", { noremap = false })
	set_map("", "<leader>p", '"+p')
	set_map("", "<leader>y", '"+y')
	set_map("n", "<leader>R", ":Gitsigns refresh<CR>", { noremap = false } )
	set_map("n", "<Leader>w", ":lua require('whitespace-nvim').trim()<CR>", { noremap = false } )
	set_map("n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>")
	set_map("n", "<leader>o", ":Outline<CR>")
	set_map("n", "<leader>vk", ':lua os.execute("vkill")<CR>')
	set_map("n", "<leader>L", ':Lushify<CR>', { noremap = false } )
	set_map("", "<leader>B", ":!touch /tmp/.build_token<CR>" )
	set_map("n", "cn", ":cnext<CR>" )
	set_map("n", "cN", ":cprev<CR>" )
	set_map("n", "cc", ":cexpr []<CR>" )
	set_map("n", "<A-i>", ":Inspect<CR>" )
	set_map("n", "<C-q>", "<C-6>" )

	-- snippet navigation
	set_map("", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>")
	set_map("!", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = false })

	-- telescope
	GetFindFilesCmd = function()
		vim.fn.system( "git rev-parse --is-inside-work-tree" )
		local is_git_repo = vim.v.shell_error == 0

		local cmd = "lua require('telescope.builtin').find_files({ search_dirs={ "
		local closer = "'.' } })"
		if not is_git_repo then
			return cmd .. closer
		end

		local dot_git_path = vim.fn.finddir( ".git", ".;" )
		if dot_git_path == "" then
			dot_git_path = vim.fn.findfile( ".git", ".;" )
		end
		local git_root = vim.fn.fnamemodify( dot_git_path, ":h" )

		local handle = io.popen( "cd " .. git_root .. " && cmake --preset $(cat builddir/current_preset) -N 2>/dev/null | rg CW_BASE_DIR | sed -E 's/.*\\\"(.*)\\\".*/\\1/g'" )
		assert(handle)
		local cw_dir = handle:read("*l")
		handle:close()
		if cw_dir and #cw_dir ~= 0 then
			cmd = cmd .. "'./" .. cw_dir .. "' ,"
		end

		return cmd .. closer
	end


	set_map("n", "<C-p>", ":lua vim.cmd( GetFindFilesCmd() )<CR>")
	set_map("n", "<A-p>", ":Telescope commander<CR>")


	-- (toggle) open current buffer in a new full screen tab, or close it if one is open
	-- I don't otherwise use tabs, so I can rely on only one open tab being the defualt
	ToggleTabSplit = function()
		if tonumber(vim.fn.tabpagenr()) == 1 then
			vim.cmd( "tab split" )
		else
			vim.api.nvim_win_close( 0, false )
		end
	end
	set_map("n", "<leader>f", ":lua ToggleTabSplit()<CR>")


	modify_width = function( delta )
		vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width( 0 ) + delta )
	end
	modify_height = function( delta )
		vim.api.nvim_win_set_height(0, vim.api.nvim_win_get_height( 0 ) + delta )
	end
	set_map("n", "<C-S-j>", ":lua modify_width(5)<CR>" )
	set_map("n", "<C-S-ö>", ":lua modify_width(-5)<CR>" )
	set_map("n", "<C-S-k>", ":lua modify_height(3)<CR>" )
	set_map("n", "<C-S-l>", ":lua modify_height(-3)<CR>" )

end

return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.mappings",
	name = "core.mappings",
	lazy = false,
	priority = 3,
	init = setup
}
