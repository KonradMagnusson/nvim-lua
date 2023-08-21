local opt = vim.opt

-- colors
vim.cmd("syntax on")
opt.background = "dark"
opt.termguicolors = true

-- default indentation is 4-wide tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false

-- show tabs, trailing whitespace, and newlines
opt.list = true
opt.listchars = "tab:▸ ,trail:·"

opt.colorcolumn = "210"
opt.signcolumn = "auto"
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true
opt.foldlevel = 99

opt.number = true
opt.relativenumber = true

opt.hidden = true
