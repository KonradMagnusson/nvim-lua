local init_dap_ui = function()
	local dap = require("dap")
	local dapui = require("dapui")

	dap.listeners.after.event_initialized.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end

	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end

	vim.fn.sign_define('DapBreakpoint', {text='󰏃', texthl='DapBreakpoint', numhl='DapBreakpoint', linehl=''})
	vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='DapBreakpointCondition', numhl='DapBreakpointCondition', linehl=''})
	vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='DapBreakpointRejected', numhl='DapBreakpointRejected', linehl=''})
	vim.fn.sign_define('DapLogPoint', {text='🗒️', texthl='DapLogPoint', numhl='DapLogPoint', linehl='DapLogPoint'})
	vim.fn.sign_define('DapStopped', {text='', texthl='DapStopped', numhl='DapStopped', linehl='DapStopped'})
end


return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	init = init_dap_ui,
	opts = {
		layouts = {
			{
				elements = {
					{
						id = "repl",
						size = 1,
					}
				},
				position = "bottom",
				size = 15,
			},
			{
				elements = {
					{
						id = "stacks",
						size = 0.4,
					},
					{
						id = "watches",
						size = 0.3,
					},
					{
						id = "scopes",
						size = 0.3,
					},
				},
				position = "left",
				size = 120,
			}
		},
	}
}
