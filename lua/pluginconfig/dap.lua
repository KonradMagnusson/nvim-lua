local dap = require("dap")

--[[
dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		command = "/usr/bin/codelldb",
		args = {"--port", "${port}"},
	}
}

dap.configurations.cpp = {{
	name = "Launch file",
	type = "codelldb",
	request = "launch",
	program = function()
		return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
},
}
--]]

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
		--args = {'-skip'},
		--args = { '-handsoff'},
		runInTerminal = false,
	},
}
dap.defaults.fallback.external_terminal = {
	command = '/usr/bin/alacritty';
	args = {'-e'};
}
