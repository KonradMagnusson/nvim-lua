local set_map = function( keys, action )
	vim.api.nvim_set_keymap("n", keys, action, { noremap = true } )
end

set_map( "<leader>db", "<CMD>lua require('persistent-breakpoints.api').toggle_breakpoint()<CR>" )
set_map( "<leader>dB", "<CMD>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<CR>" )
set_map( "<leader>dlp", "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" )

set_map( "<leader>dc", "<CMD>lua require('dap').continue()<CR>" )
set_map( "<leader>dr", "<CMD>lua require('dap').run_to_cursor()<CR>" )

set_map( "<leader>ds", "<CMD>lua require('dap').step_over()<CR>" )
set_map( "<leader>di", "<CMD>lua require('dap').step_into()<CR>" )
set_map( "<leader>do", "<CMD>lua require('dap').step_out()<CR>" )


-- According to DAP, stacks grow downwards. This is somewhat sensible, considering they often do in terms of memory addressing, but very few people
-- would say you "pop something off the bottom of the stack".
set_map( "<C-A-down>", "<CMD>lua require('dap').up()<CR>" )
set_map( "<C-A-up>", "<CMD>lua require('dap').down()<CR>" )


-- these aren't blocking per se - they return a coroutine that dap configurations are forced to wait for
function BlockingUIInput(  opts )
	return coroutine.create( function( co ) vim.ui.input( opts, function( txt ) coroutine.resume( co, txt ) end ) end )
end

function BlockingUISelect( items, opts )
	return coroutine.create( function( co ) vim.ui.select( items, opts, function( selection ) coroutine.resume( co, selection ) end ) end )
end


function GetDebuggee()
	return coroutine.create(function( co )
		local bin_dir = vim.fn.getcwd() .. "/build/binaries/"
		local bins = {}
		for bin in io.popen("ls " .. bin_dir .. "{Marius,Trajan}* 2>/dev/null"):lines() do
			bin = bin:gsub( bin_dir, "" )
			table.insert( bins, bin )
		end
		if #bins > 0 then
			vim.ui.select( bins, { label = "bin: " }, function( bin ) coroutine.resume( co, bin_dir .. bin ) end )
		else
			vim.ui.input( { prompt = "  Target > " } , function( bin ) coroutine.resume( co, bin ) end )
		end
	end)
end

function GetOrSetArgs()
	return coroutine.create(
		function( co )
			vim.ui.input(
			{ prompt = "Args: ", default = vim.g.CMD_LINE_ARGS },
			function( args )
				vim.g.CMD_LINE_ARGS = args
				args = args .. " -suppress-error-log"
				coroutine.resume( co, { args } )
			end )
		end )
end

local init_dap = function( opts )
	local dap = require("dap")
	local daputils = require("dap.utils")

	if vim.g.CMD_LINE_ARGS == nil or type(vim.g.CMD_LINE_ARGS) ~= "string" then
		vim.g.CMD_LINE_ARGS = ""
	end

	dap.defaults.fallback.external_terminal = {
		command = "/usr/bin/alacritty",
		args = { "-e" }
	}

	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-dap",
		name = "lldb",
	}

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "-i", "dap" }
	}

	dap.configurations.cpp = {
		{
			name = "Debug",
			type = "lldb",
			request = "launch",
			program = GetDebuggee,
			args = GetOrSetArgs,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
		{
			name = "Debug [gdb]",
			type = "gdb",
			request = "launch",
			program = GetDebuggee,
			args = GetOrSetArgs,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
		{
			name = "Debug [noargs]",
			type = "lldb",
			request = "launch",
			program = GetDebuggee,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
		{
			name = "Attach to running game",
			type = "lldb",
			request = "attach",
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
			pid = function() return daputils.pick_process({ filter = function( proc ) return proc.name:find("Marius") or proc.name:find("Trajan") end }) end,
		}
	}
end



return {
  "mfussenegger/nvim-dap", init = init_dap
}
