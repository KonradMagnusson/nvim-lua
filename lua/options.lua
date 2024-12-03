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

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.hidden = true

vim.opt.errorformat = [[
%-GIn file%.%#:,%W%f:%l:%c: %tarning: %m,%E%f:%l:%c: %trror: %m,%C%s,%C%m,%Z%m,%E%>ld.lld: %trror: %m,%C%>>>> referenced by %s (%f:%l),%-C%>>>>%s,%C%s,%-Z,%-G%.%#
]]

local function cmake_preset()
	handle = io.popen([[cat builddir/current_preset 2>/dev/null]])
	assert(handle)
	local preset = handle:read("*l")
	handle:close()
	if preset == nil then
		return ""
	end

	return "⫷ " .. preset .. "⫸ "
end
local function get_workspace()
	handle = io.popen([[pwd | sed 's/.*proj\/\(.*\)\/.*/\1/']])
	assert(handle)
	local workspace = handle:read("*l")
	handle:close()
	return "[" .. (workspace or "") .. "]"
end

vim.opt.statusline = [[%<%f %h%w%m%r%=%S    ]] .. cmake_preset() ..  [[%=%-14.(%l,%c%V%) ]] .. get_workspace() .. [[ %P]]

-- TODO: I want to make this very flexible, but syntax/qf.vim has a hardcoded dependency on column order...
local qf_format = "{file}|L{line}:{col}{padding}{type}|{text}"
local pad_target = 50 --(temporary) number of characters (from start of line) to pad the {text}↑ to

QFTextFunc = function( info )
	if info.quickfix ~= 1 then
		return -- idc about loclist atm
	end

	local list = vim.fn.getqflist( { id = info.id, items = 0, qfbufnr = 0, context = 0 } )
	local ret = {}

	for i = info.start_idx, info.end_idx do
		local item = list.items[ i ]
		if item.valid then
			local full_path = vim.api.nvim_buf_get_name( item.bufnr )
			local file = string.gsub( full_path, "([/%w]+)/(%w.%w)", "%2" )

			local type = "?"
			if item.type == "e" then type = "error" end
			if item.type == "w" then type = "warning" end
			if item.type == "n" then type = "note" end

			-- (temporary) - hardcoded padding calculations to match the hardcoded format above
			local pad_width = pad_target - ( #file + 2 + #tostring(item.lnum) + 1 + #tostring(item.col) + #type + 1)
			local padding = string.rep(" ", pad_width)

			local fmt = qf_format
			fmt = string.gsub( fmt, "{col}", item.col )
			fmt = string.gsub( fmt, "{file}", file )
			fmt = string.gsub( fmt, "{line}", item.lnum )
			fmt = string.gsub( fmt, "{padding}", padding )
			fmt = string.gsub( fmt, "{text}", item.text )
			fmt = string.gsub( fmt, "{type}", type )
			table.insert( ret, fmt)
		end
	end

	return ret
end
vim.o.quickfixtextfunc = "v:lua.QFTextFunc"
