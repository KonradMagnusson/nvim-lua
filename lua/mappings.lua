local nvim_set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","



-- basics
nvim_set_keymap("n", "j", "h", { noremap = true })
nvim_set_keymap("v", "j", "h", { noremap = true })

nvim_set_keymap("n", "k", "j", { noremap = true })
nvim_set_keymap("v", "k", "j", { noremap = true })

nvim_set_keymap("n", "l", "k", { noremap = true })
nvim_set_keymap("v", "l", "k", { noremap = true })

nvim_set_keymap("n", "ö", "l", { noremap = true })
nvim_set_keymap("v", "ö", "l", { noremap = true })

nvim_set_keymap("n", "h", "0", { noremap = true })
nvim_set_keymap("v", "h", "0", { noremap = true })

nvim_set_keymap("n", "ä", "$", { noremap = true })
nvim_set_keymap("v", "ä", "$", { noremap = true })

-- scrolling
nvim_set_keymap("n", "<C-K>", "5<C-E>5k", {noremap = false, nowait = true })
nvim_set_keymap("n", "<C-L>", "5<C-Y>5l", {noremap = false, nowait = true })


-- misc
nvim_set_keymap("n", "<leader>3", "<CMD>noh<CR>", { noremap = false })
nvim_set_keymap("n", "<leader>p", '"+p', { noremap = false } )
nvim_set_keymap("n", "<leader>R", '<CMD>lua ReloadConfig()<CR>', { noremap = false } )
nvim_set_keymap("n", "<leader>L", '<CMD>Lushify<CR>', { noremap = false } )

-- telescope
local cmd_center = "<CMD>Telescope command_center<CR>"
local find_files = "<CMD>Telescope find_files<CR>"

nvim_set_keymap("n", "<A-p>", cmd_center, { noremap = true })
nvim_set_keymap("n", "<C-p>", find_files, { noremap = true })


---------------------------------------------------------------
-- dap
local dap_toggle_breakpoint = "<CMD>lua require('dap').toggle_breakpoint()<CR>"
local dap_continue = "<CMD>lua require('dap').continue()<CR>"
local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"

nvim_set_keymap("n", "<Leader>db", dap_toggle_breakpoint, { noremap = true })
nvim_set_keymap("n", "<Leader>dc", dap_continue, { noremap = true })
nvim_set_keymap("n", "<Leader>ds", dap_step_over, { noremap = true })
nvim_set_keymap("n", "<Leader>di", dap_step_into, { noremap = true })
nvim_set_keymap("n", "<Leader>do", dap_step_out, { noremap = true })
nvim_set_keymap("n", "<Leader>dr", dap_repl, { noremap = true })
