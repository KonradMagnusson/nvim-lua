local set_map = function( keys, action )
	vim.api.nvim_set_keymap("n", keys, action, { noremap = true } )
end

set_map( "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>" )
set_map( "<leader>dB", "<CMD>lua require('dap').toggle_breakpoint(vim.fn.input('Condition: '))<CR>" )
set_map( "<leader>dlp", "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" )

set_map( "<leader>dc", "<CMD>lua require('dap').continue()<CR>" )
set_map( "<leader>dr", "<CMD>lua require('dap').run_to_cursor()<CR>" )

set_map( "<leader>ds", "<CMD>lua require('dap').step_over()<CR>" )
set_map( "<leader>di", "<CMD>lua require('dap').step_into()<CR>" )
set_map( "<leader>do", "<CMD>lua require('dap').step_out()<CR>" )


-- according to DAP, callstacks grow downwards
set_map( "<C-A-down>", "<CMD>lua require('dap').up()<CR>" )
set_map( "<C-A-up>", "<CMD>lua require('dap').down()<CR>" )


local init_dap = function()
	local dap = require("dap")
	local daputils = require("dap.utils")

	dap.defaults.fallback.external_terminal = {
		command = "/usr/bin/alacritty",
		args = { "-e" }
	}

	dap.adapters.lldb = {
		type = 'executable',
		command = '/usr/bin/lldb-vscode',
		name = "lldb",
		options = {
			initialize_timeout_sec = 10,
		}
	}

	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return coroutine.create(function(dap_run_co)
					local bin_dir = vim.fn.getcwd() .. "/build/binaries/"
					local bins = {}
					for bin in io.popen("ls " .. bin_dir .. "victoria3*"):lines() do
						bin = bin:gsub( bin_dir, "" )
						table.insert( bins, bin )
					end
					vim.ui.select( bins, { label = "bin: " }, function( bin ) coroutine.resume(dap_run_co, bin_dir .. bin ) end )
				end)
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			runInTerminal = false,
			--args = { '-skip' },
			--args = { '-skip', '-handsoff' },
			--args = { '-skip', '-handsoff'},-- '-nographics' },
			args = { '-loadsave=nerd' },
			--args = { '-loadsave=ctd' }, --, '-handsoff', '-nographics' },
			--args = { '-handsoff'},
			--args = { '-mapeditor' },
		},
		{
			name = "Attach",
			type = "lldb",
			request = "attach",
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			runInTerminal = false,
			pid = function() return daputils.pick_process({ filter = 'victoria3' }) end
		}
	}
end



return {
	"mfussenegger/nvim-dap",
	init = init_dap
}
