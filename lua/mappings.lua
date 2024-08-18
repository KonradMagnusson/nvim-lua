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

set_map("", "tq", "<CMD>tabclose<CR>", { noremap = true })

-- scrolling
set_map("n", "<C-K>", "10<C-E>10k", {noremap = false, nowait = true })
set_map("n", "<C-L>", "10<C-Y>10l", {noremap = false, nowait = true })
set_map("n", "<C-A-K>", "<C-E>k", {noremap = false, nowait = true })
set_map("n", "<C-A-L>", "<C-Y>l", {noremap = false, nowait = true })


-- misc
set_map("n", "<leader>3", "<CMD>noh<CR>", { noremap = false })
set_map("n", "<leader>p", '"+p', { noremap = false } )
set_map("n", "<leader>y", '"+y', { noremap = false } )
set_map("n", "<leader>R", "<CMD>Gitsigns refresh<CR>", { noremap = false } )
set_map("n", "<Leader>w", "<CMD>lua require('whitespace-nvim').trim()<CR>", { noremap = false } )
set_map("n", "<leader>df", "<CMD>lua vim.diagnostic.open_float()<CR>", { noremap = true })
set_map("n", "<leader>o", "<CMD>Outline<CR>", { noremap = true })

-- lush
set_map("n", "<leader>L", '<CMD>Lushify<CR>', { noremap = false } )

-- snippet navigation
set_map("", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = true })
set_map("!", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = false })

-- telescope
local find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.' } })<CR>"
if string.find( os.getenv("PWD"), "proj/develop" ) then
	find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.', '/home/qnrd/proj/develop/cw' } })<CR>"
elseif string.find(os.getenv("PWD"), "proj/A" ) then
	find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.', '/home/qnrd/proj/A/cw' } })<CR>"
elseif string.find(os.getenv("PWD"), "proj/B" ) then
	find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.', '/home/qnrd/proj/B/cw' } })<CR>"
end

set_map("n", "<C-p>", find_files, { noremap = true })
set_map("n", "<A-p>", "<CMD>Telescope commander<CR>", { noremap = true })




-- lsp
set_map("n", "<leader>S", "<CMD>LspStop<CR>", { noremap = true } )
set_map("n", "<leader><C-s>", "<CMD>LspRestart<CR>", { noremap = true } )
