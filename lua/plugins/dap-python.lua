return {
	"mfussenegger/nvim-dap-python",
	cond = function( LazyPlugin ) return vim.bo.filetype == "python" end,
	init = function() require("dap-python").setup("/usr/bin/python") end
}
