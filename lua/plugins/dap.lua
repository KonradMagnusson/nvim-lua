local init_dap = function()
	local dap = require("dap")


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
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = { '-skip', "-loadsave=autosave" },
			--args = { '-skip', '-handsoff'},-- '-nographics' },
			--args = { '-loadsave=1892' },
			--args = { '-loadsave=ctd' }, --, '-handsoff', '-nographics' },
			--args = { '-handsoff'},
			--args = { '-mapeditor' },
			runInTerminal = false,
		},
	}

end



return {
	"mfussenegger/nvim-dap",
	init = init_dap
}
