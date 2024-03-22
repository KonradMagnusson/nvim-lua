local nvim_set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","



-- basics
nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
nvim_set_keymap("t", "<C-left>", "<Esc><C-w>h", {})
nvim_set_keymap("t", "<C-down>", "<Esc><C-w>j", {})
nvim_set_keymap("t", "<C-up>", "<Esc><C-w>k", {})
nvim_set_keymap("t", "<C-right>", "<Esc><C-w>l", {})
nvim_set_keymap("", "<C-left>", "<C-w>h", { noremap = true })
nvim_set_keymap("", "<C-down>", "<C-w>j", { noremap = true })
nvim_set_keymap("", "<C-up>", "<C-w>k", { noremap = true })
nvim_set_keymap("", "<C-right>", "<C-w>l", { noremap = true })

nvim_set_keymap("", "j", "h", { noremap = true })
nvim_set_keymap("", "k", "j", { noremap = true })
nvim_set_keymap("", "l", "k", { noremap = true })
nvim_set_keymap("", "ö", "l", { noremap = true })
nvim_set_keymap("", "h", "0", { noremap = true })
nvim_set_keymap("", "ä", "$", { noremap = true })

nvim_set_keymap("", "tq", "<CMD>tabclose<CR>", { noremap = true })

-- scrolling
nvim_set_keymap("n", "<C-K>", "10<C-E>10k", {noremap = false, nowait = true })
nvim_set_keymap("n", "<C-L>", "10<C-Y>10l", {noremap = false, nowait = true })
nvim_set_keymap("n", "<C-A-K>", "<C-E>k", {noremap = false, nowait = true })
nvim_set_keymap("n", "<C-A-L>", "<C-Y>l", {noremap = false, nowait = true })


-- misc
nvim_set_keymap("n", "<leader>3", "<CMD>noh<CR>", { noremap = false })
nvim_set_keymap("n", "<leader>p", '"+p', { noremap = false } )
nvim_set_keymap("n", "<leader>y", '"+y', { noremap = false } )
nvim_set_keymap("n", "<leader>f", "<CMD>silent !~/CAL/external_libs3/common/clang-format/linux/clang-format -i %:p<CR>", { noremap = false } )

-- whitespace
nvim_set_keymap("n", "<Leader>w", "<CMD>lua require('whitespace-nvim').trim()<CR>", { noremap = false } )

-- lush
nvim_set_keymap("n", "<leader>L", '<CMD>Lushify<CR>', { noremap = false } )
nvim_set_keymap("n", "<leader>R", "<CMD>lua require('lush')(require('colors.qnrd'))<CR>", { noremap = false } )

-- ctags
nvim_set_keymap("n", "gd", "<C-]><CR>", { noremap = false })
nvim_set_keymap("n", "gD", "g]", { noremap = false })

-- snippet navigation
nvim_set_keymap("", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = true })
nvim_set_keymap("!", "<leader><leader>", "<Esc>/<++><CR>:noh<CR>cf>", { noremap = false })

-- telescope
local find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.' } })<CR>"
if string.find( os.getenv("PWD"), "CAL" ) then
	find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.', '/home/qnrd/CAL/cw' } })<CR>"
elseif string.find(os.getenv("PWD"), "WT" ) then
	find_files = "<CMD>lua require('telescope.builtin').find_files({ search_dirs={ '.', '/home/qnrd/WT/cw' } })<CR>"
end

nvim_set_keymap("n", "<C-p>", find_files, { noremap = true })
nvim_set_keymap("n", "<A-p>", "<CMD>Telescope commander<CR>", { noremap = true })

nvim_set_keymap("n", "<leader>df", "<CMD>lua vim.diagnostic.open_float()<CR>", { noremap = true })

-- larry
nvim_set_keymap("n", "<leader>P", "<CMD>LarrySelectPreset<CR>", { noremap = true })
nvim_set_keymap("n", "<leader>lC", "<CMD>LarryConfigure<CR>", { noremap = true })
nvim_set_keymap("n", "<leader>lc", "<CMD>LarryToggleConfigureView<CR>", { noremap = true })
nvim_set_keymap("n", "<leader>B", "<CMD>LarryBuild<CR>", { noremap = true })
nvim_set_keymap("n", "<leader>b", "<CMD>LarryToggleBuildView<CR>", { noremap = true })


-- lens
nvim_set_keymap("n", "<leader>l", "<CMD>LspLensToggle<CR>", { noremap = true })
