return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	config = function(LazyPlugin, opts) require("dap-python").setup("/usr/bin/python") end
}
