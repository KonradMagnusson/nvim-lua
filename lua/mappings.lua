local set_map = vim.api.nvim_set_keymap

vim.g.mapleader = ","



-- basics
set_map("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
set_map("t", "<C-left>", "<Esc><C-w>h", {})
set_map("t", "<C-down>", "<Esc><C-w>j", {})
set_map("t", "<C-up>", "<Esc><C-w>k", {})
set_map("t", "<C-right>", "<Esc><C-w>l", {})
set_map("", "<C-left>", "<C-w>h", { noremap = true })
set_map("", "<C-down>", "<C-w>j", { noremap = true })
set_map("", "<C-up>", "<C-w>k", { noremap = true })
set_map("", "<C-right>", "<C-w>l", { noremap = true })

set_map("", "j", "h", { noremap = true })
set_map("", "k", "j", { noremap = true })
set_map("", "l", "k", { noremap = true })
set_map("", "ö", "l", { noremap = true })
set_map("", "h", "0", { noremap = true })
set_map("", "ä", "$", { noremap = true })

set_map("", "tq", ":tabclose<CR>", { noremap = true })

-- scrolling
set_map("n", "<C-K>", "10<C-E>10k", {noremap = false, nowait = true })
set_map("n", "<C-L>", "10<C-Y>10l", {noremap = false, nowait = true })
set_map("n", "<C-A-K>", "<C-E>k", {noremap = false, nowait = true })
set_map("n", "<C-A-L>", "<C-Y>l", {noremap = false, nowait = true })


-- misc
set_map("n", "<leader>3", ":noh<CR>", { noremap = false })
set_map("n", "<leader>p", '"+p', { noremap = false } )
set_map("n", "<leader>y", '"+y', { noremap = false } )
set_map("n", "<leader>R", ":Gitsigns refresh<CR>", { noremap = false } )
set_map("n", "<Leader>w", ":lua require('whitespace-nvim').trim()<CR>", { noremap = false } )
set_map("n", "<leader>df", ":lua vim.diagnostic.open_float()<CR>", { noremap = true })
set_map("n", "<leader>o", ":Outline<CR>", { noremap = true })
set_map("n", "<leader>vk", ':lua os.execute("vkill")<CR>', { noremap = true })

-- lush
set_map("n", "<leader>L", ':Lushify<CR>', { noremap = false } )

-- snippet navigation
set_map("", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = true })
set_map("!", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = false })

-- telescope
_G.GetFindFilesCmd = function()
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

	local handle = io.popen( "cd " .. git_root .. " && cmake --preset $(cat builddir/current_preset) -N | rg CW_BASE_DIR | sed -E 's/.*\\\"(.*)\\\".*/\\1/g'" )
	assert(handle)
	local cw_dir = handle:read("*l")
	handle:close()
	if cw_dir and #cw_dir ~= 0 then
		cmd = cmd .. "'./" .. cw_dir .. "' ,"
	end

	return cmd .. closer
end


set_map("n", "<C-p>", ":lua vim.cmd(_G.GetFindFilesCmd())<CR>", { noremap = true })
set_map("n", "<A-p>", ":Telescope commander<CR>", { noremap = true })




-- lsp
reset_hints = function()
	vim.lsp.inlay_hint.enable( false )
	vim.lsp.inlay_hint.enable( true )
end
set_map("n", "<leader>S", ":lua reset_hints<CR>", { noremap = true } )
set_map("n", "<leader><C-s>", ":LspStop<CR>", { noremap = true } )

