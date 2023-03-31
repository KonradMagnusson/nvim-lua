local opt = vim.opt
local lush = require('lush')

-- colors
vim.cmd("syntax on")
opt.background = "dark"
opt.termguicolors = true

lush(require('qnrd'))

-- vim.cmd("colorscheme qnrd")

-- default indentation is 4-wide tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false

-- show tabs, trailing whitespace, and newlines
opt.list = true
opt.listchars = "tab:▸ ,trail:·"

-- 80 usable
opt.colorcolumn = "81"
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true
opt.foldlevel = 99

opt.number = true
opt.relativenumber = true

opt.hidden = true
