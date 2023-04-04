local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode",
	name = "lldb",
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	name = "gdb",
}

dap.configurations.cpp = {{
	name = "Launch",
	type = "gdb",
	request = "launch",
	program = function()
		return vim.ui.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
}}

dap.defaults.fallback.external_terminal = {
  command = '/usr/bin/alacritty';
  args = {'-e'};
}
