local function setup()
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

	--vim.opt.colorcolumn = "150,170,210"
	vim.opt.signcolumn = "auto"
	vim.opt.cursorline = true

	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.foldlevel = 99
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldmethod = "expr"

	vim.opt.equalprg = "clang-format"

	vim.opt.number = true
	vim.opt.relativenumber = true

	vim.opt.swapfile = false
	vim.opt.hidden = true

	vim.opt.undofile = true

	-- basically service locators
	vim.g.qnrd_get_workspace = function() return string.match(vim.fn.getcwd(), ".*/([^/]+)") end
	vim.g.qnrd_get_project_dirs = function() return { "." } end


	local function cmake_preset()
		handle = io.popen([[cat builddir/current_preset 2>/dev/null]])
		assert(handle)
		local preset = handle:read("*l")
		handle:close()
		if preset == nil then
			return ""
		end

		return "[" .. preset .. "]"
	end

	vim.g.BuildStatusLine = function( build_status )
		return [[%<%f %h%w%m%r%=%S    ]]
			.. cmake_preset()
			.. [[%=%-14.(%l,%c%V%) ]] .. (build_status or "") .. "  "
			.. "[" .. vim.g.qnrd_get_workspace() .. "]"
			.. [[ %P]]
	end
	vim.opt.statusline = vim.g.BuildStatusLine()
end


return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.options",
	name = "core.options",
	lazy = false,
	priority = 2,
	init = setup
}
