vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- colors
vim.opt.syntax = "on"
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- default indentation is 4-wide tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

-- show tabs, trailing whitespace, and newlines
vim.opt.list = true
vim.opt.listchars = "tab:›  ,trail:󰱪,nbsp:󱁐"

vim.opt.colorcolumn = "150,170,210"
vim.opt.signcolumn = "auto"
vim.opt.cursorline = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldlevel = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.errorformat = [[
%-GIn file%.%#:,%W%f:%l:%c: %tarning: %m,%E%f:%l:%c: %trror: %m,%C%s,%C%m,%Z%m,%E%>ld.lld: %trror: %m,%C%>>>> referenced by %s (%f:%l),%-C%>>>>%s,%C%s,%-Z,%-G%.%#
]]
