local set_map = function( keys, action )
	vim.api.nvim_set_keymap( "n", keys, action, { noremap = true } )
end

set_map( "<leader>db", "<CMD>lua require( 'persistent-breakpoints.api' ).toggle_breakpoint()<CR>" )
set_map( "<leader>dB", "<CMD>lua require( 'persistent-breakpoints.api' ).set_conditional_breakpoint()<CR>" )
set_map( "<leader>dlp", "<CMD>lua require( 'dap' ).set_breakpoint( nil, nil, vim.fn.input( 'Log point message: ' ))<CR>" )

set_map( "<leader>dc", "<CMD>lua require( 'dap' ).continue()<CR>" )
set_map( "<leader>dr", "<CMD>lua require( 'dap' ).run_to_cursor()<CR>" )

set_map( "<leader>ds", "<CMD>lua require( 'dap' ).step_over()<CR>" )
set_map( "<leader>di", "<CMD>lua require( 'dap' ).step_into()<CR>" )
set_map( "<leader>do", "<CMD>lua require( 'dap' ).step_out()<CR>" )


-- According to DAP, stacks grow downwards. This is somewhat sensible, considering they often do in terms of memory addressing, but very few people
-- would say you "pop something off the bottom of the stack".
set_map( "<C-A-down>", "<CMD>lua require( 'dap' ).up()<CR>" )
set_map( "<C-A-up>", "<CMD>lua require( 'dap' ).down()<CR>" )


function GetDebuggee()
	return coroutine.create( function( co )
		local ignored_extensions = { "*.so*", "*.flac", "*.mp3", "*.bin", "*.sh", "*.py" }

		local fd_cmd = "fd --no-ignore --type x --exclude .git"
		for _, ext in pairs( ignored_extensions ) do
			fd_cmd = fd_cmd .. " --exclude " .. ext
		end

		local handle = io.popen( fd_cmd )
		assert( handle )
		local result = handle:read( "*a" )
		handle:close()

		local bins = vim.split( result, '\n', { trimempty = true } )

		local remember_and_resume = function( bin )
			vim.g.QNRD_DEBUGGEE = bin
			coroutine.resume( co, bin )
		end
		local format_item = function( bin )
			if #bin < 60 then
				return bin
			end

			return vim.fn.pathshorten( bin, 2 )
		end

		if #bins > 0 then
			vim.ui.select( bins, { label = "bin: ", format_item = format_item }, remember_and_resume )
		else
			vim.ui.input( { prompt = "  Target > ", default = vim.g.QNRD_DEBUGGEE } , remember_and_resume )
		end
	end )
end

function FilterProcesses( input )
	local user_handle = io.popen( "whoami" )
	assert( user_handle )
	local user = user_handle:read( "*a" )
	user_handle:close()

	local pid_handle = io.popen( "ps -o user= -p " .. input.pid )
	assert( pid_handle )
	local owner = pid_handle:read( "*a" )
	pid_handle:close()

	return owner == user
end

function GetOrSetArgs()
	return coroutine.create(
		function( co )
			vim.ui.input(
			{ prompt = "Args: ", default = vim.g.QNRD_DEBUG_ARGS },
			function( args )
				vim.g.QNRD_DEBUG_ARGS = args
				coroutine.resume( co, { args } )
			end )
		end )
end

local init_dap = function( opts )
	local dap = require( "dap" )
	local daputils = require( "dap.utils" )

	if vim.g.QNRD_DEBUG_ARGS == nil or type( vim.g.QNRD_DEBUG_ARGS ) ~= "string" then
		vim.g.QNRD_DEBUG_ARGS = ""
	end

	dap.defaults.fallback.external_terminal = {
		command = "/usr/bin/kitty",
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
			name = "Attach",
			type = "lldb",
			request = "attach",
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
			pid = function() return daputils.pick_process( { filter = FilterProcesses } ) end,
		}
	}
end



return {
  "mfussenegger/nvim-dap", init = init_dap
}
