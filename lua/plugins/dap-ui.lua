local init_dap_ui = function()
	local dap = require("dap")
	local dapui = require("dapui")

	dap.listeners.after.event_initialized.dapui_config = function()
		dapui.open()
	end

	vim.fn.sign_define('DapBreakpoint', {text='💩', texthl='DapBreakpoint', numhl='DapBreakpoint', linehl=''})
	vim.fn.sign_define('DapBreakpointCondition', {text='?', texthl='DapBreakpointCondition', numhl='DapBreakpointCondition', linehl=''})
	vim.fn.sign_define('DapBreakpointRejected', {text='×', texthl='DapBreakpointRejected', numhl='DapBreakpointRejected', linehl=''})
	vim.fn.sign_define('DapLogPoint', {text='L', texthl='DapLogPoint', numhl='DapLogPoint', linehl=''})
	vim.fn.sign_define('DapStopped', {text='▶', texthl='DapStopped', numhl='DapStopped', linehl='DapStopped'})
end


return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap" },
	init = init_dap_ui, 
	opts = {
		layouts = {{
			elements = {{
				id = "scopes",
				size = 0.5,
			}, {
				id = "repl",
				size = 0.5,
			}},
			position = "bottom",
			size = 15,
		}, {
			elements = {{
				id = "stacks",
				size = 0.7,
			}, {
				id = "watches",
				size = 0.3,
			}},
			position = "left",
			size = 60,
		}},
	}
}
