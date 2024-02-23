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
			args = { '-skip' },
			--args = { '-skip', '-handsoff' },
			--args = { '-skip', '-handsoff'},-- '-nographics' },
			--args = { '-loadsave=nerd' },
			--args = { '-loadsave=ctd' }, --, '-handsoff', '-nographics' },
			--args = { '-handsoff'},
			--args = { '-mapeditor' },
			runInTerminal = false,
		},
	}

	local dap_toggle_breakpoint = "<CMD>lua require('dap').toggle_breakpoint()<CR>"
	local dap_toggle_conditional_breakpoint = "<CMD>lua require('dap').toggle_breakpoint(vim.fn.input('Condition: '))<CR>"
	local dap_logpoint = "<CMD>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
	local dap_continue = "<CMD>lua require('dap').continue()<CR>"
	local dap_step_over = "<CMD>lua require('dap').step_over()<CR>"
	local dap_step_into = "<CMD>lua require('dap').step_into()<CR>"
	local dap_step_out = "<CMD>lua require('dap').step_out()<CR>"
	local dap_repl = "<CMD>lua require('dap').repl.open()<CR>"
	local dap_up = "<CMD>lua require('dap').up()<CR>"
	local dap_down = "<CMD>lua require('dap').down()<CR>"

	local nvim_set_keymap = vim.api.nvim_set_keymap

	nvim_set_keymap("n", "<leader>db", dap_toggle_breakpoint, { noremap = true })
	nvim_set_keymap("n", "<leader>dB", dap_toggle_conditional_breakpoint, { noremap = true })
	nvim_set_keymap("n", "<leader>dlp", dap_logpoint, { noremap = true })

	nvim_set_keymap("n", "<leader>da", "<CMD>lua AttachToProcess()<CR>", { noremap = true })
	nvim_set_keymap("n", "<leader>dc", dap_continue, { noremap = true })
	nvim_set_keymap("n", "<leader>ds", dap_step_over, { noremap = true })
	nvim_set_keymap("n", "<leader>di", dap_step_into, { noremap = true })
	nvim_set_keymap("n", "<leader>do", dap_step_out, { noremap = true })

	nvim_set_keymap("n", "<leader>dr", dap_repl, { noremap = true })

	-- according to dap, callstacks grow downwards
	nvim_set_keymap("n", "<C-A-down>", dap_up, { noremap = true  })
	nvim_set_keymap("n", "<C-A-up>", dap_down, { noremap = true  })

end



return {
	"mfussenegger/nvim-dap",
	init = init_dap
}
