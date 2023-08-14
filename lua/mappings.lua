local nvim_set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","



-- basics
nvim_set_keymap("", "j", "h", { noremap = true })
nvim_set_keymap("", "k", "j", { noremap = true })
nvim_set_keymap("", "l", "k", { noremap = true })
nvim_set_keymap("", "ö", "l", { noremap = true })
nvim_set_keymap("", "h", "0", { noremap = true })
nvim_set_keymap("", "ä", "$", { noremap = true })

-- scrolling
nvim_set_keymap("n", "<C-K>", "10<C-E>10k", {noremap = false, nowait = true })
nvim_set_keymap("n", "<C-L>", "10<C-Y>10l", {noremap = false, nowait = true })


-- misc
nvim_set_keymap("n", "<leader>3", "<CMD>noh<CR>", { noremap = false })
nvim_set_keymap("n", "<leader>p", '"+p', { noremap = false } )
nvim_set_keymap("n", "<leader>y", '"+y', { noremap = false } )
nvim_set_keymap("n", "<leader>R", '<CMD>lua ReloadConfig()<CR>', { noremap = false } )

-- whitespace
nvim_set_keymap("n", "<Leader>w", "<CMD>lua require('whitespace-nvim').trim()<CR>", { noremap = false } )

-- lush
nvim_set_keymap("n", "<leader>L", '<CMD>Lushify<CR>', { noremap = false } )


-- ctags
nvim_set_keymap("n", "gd", "<C-]><CR>", { noremap = false })
nvim_set_keymap("n", "gD", "g]", { noremap = false })

-- snippet navigation
nvim_set_keymap("", "<leader><leader>", "<Esc>/<++><CR>cf>", { noremap = true })
nvim_set_keymap("!", "<leader><leader>", "<Esc>/<++><CR>cf>", { noremap = false })

-- telescope
nvim_set_keymap("n", "<A-p>", "<CMD>Telescope command_center<CR>", { noremap = true })
nvim_set_keymap("n", "<C-p>", "<CMD>Telescope find_files<CR>", { noremap = true })
nvim_set_keymap("n", "<leader>s", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true })

-- treesitter
nvim_set_keymap("n", "<leader>h", '<CMD>TSHighlightCapturesUnderCursor<CR>', { noremap = false } )


---------------------------------------------------------------
-- dap
local dap_toggle_breakpoint = "<CMD>lua require('dap').toggle_breakpoint()<CR>"
local dap_continue = "<CMD>lua require('dap').continue()<CR>"
local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"
local dap_up = "<CMD>lua require('dap').up()<CR>"
local dap_down = "<CMD>lua require('dap').down()<CR>"

nvim_set_keymap("n", "<leader>db", dap_toggle_breakpoint, { noremap = true })
nvim_set_keymap("n", "<F9>", dap_toggle_breakpoint, { noremap = true })

nvim_set_keymap("n", "<leader>dc", dap_continue, { noremap = true })
nvim_set_keymap("n", "<F5>", dap_continue, { noremap = true })

nvim_set_keymap("n", "<leader>ds", dap_step_over, { noremap = true })
nvim_set_keymap("n", "<F10>", dap_step_over, { noremap = true })

nvim_set_keymap("n", "<leader>di", dap_step_into, { noremap = true })
nvim_set_keymap("n", "<F11>", dap_step_into, { noremap = true })

nvim_set_keymap("n", "<leader>do", dap_step_out, { noremap = true })
nvim_set_keymap("n", "<F12>", dap_step_out, { noremap = true })

nvim_set_keymap("n", "<leader>dr", dap_repl, { noremap = true })

nvim_set_keymap("n", "<leader>du", dap_up, { noremap = true  })
nvim_set_keymap("n", "<leader>dd", dap_down, { noremap = true  })
