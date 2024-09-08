vim.api.nvim_set_keymap( "n", "<leader>w", "[c", { noremap = false } ) -- previous diff
vim.api.nvim_set_keymap( "n", "<A-l>", "[c", { noremap = false } ) -- previous diff
vim.api.nvim_set_keymap( "n", "<leader>e", "]c", { noremap = false } ) -- next diff
vim.api.nvim_set_keymap( "n", "<A-k>", "]c", { noremap = false } ) -- next diff

vim.api.nvim_set_keymap( "n", "<leader>1", "<CMD>diffget LOCAL<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<leader>2", "<CMD>diffget BASE<CR>", { noremap = true } )
vim.api.nvim_set_keymap( "n", "<leader>3", "<CMD>diffget REMOTE<CR>", { noremap = true } )

