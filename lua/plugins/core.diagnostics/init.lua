local function setup()
	vim.fn.sign_define( 'DiagnosticSignError', { text='', texthl='DiagnosticSignError', numhl='DiagnosticSignError', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignWarn',  { text='', texthl='DiagnosticSignWarn', numhl='DiagnosticSignWarn', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignInfo',  { text='', texthl='DiagnosticSignInfo', numhl='DiagnosticSignInfo', linehl='' } )
	vim.fn.sign_define( 'DiagnosticSignHint',  { text='🯈', texthl='DiagnosticSignHint', numhl='DiagnosticSignHint', linehl='' } )
end

return {
	dir = vim.fn.stdpath("config") .. "/lua/plugins/core.diagnostics",
	name = "core.diagnostics",
	lazy = false,
	priority = 3,
	init = setup
}
