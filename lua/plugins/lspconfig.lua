local function set_lsp_maps( client, bufnr )
	local qnrdutils = require("qnrd-utils")
	local set_map = qnrdutils.set_map
	set_map( "n", "<C-h>", vim.lsp.inlay_hint.enable )

	-- code navigation
	set_map( "n", "gd", vim.lsp.buf.definition )
	set_map( "n", "gr", vim.lsp.buf.references )
	set_map( "n", "g?", vim.lsp.buf.signature_help )
	set_map( "n", "gh", function() vim.lsp.buf.typehierarchy('supertypes') end )
	set_map( "n", "gH", function() vim.lsp.buf.typehierarchy('subtypes') end )

	set_map( "n", "<leader>s", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>" )
	set_map( "n", "<leader>m", "<CMD>Telescope lsp_document_symbols<CR>" )

	-- edit actions
	set_map( "n", "<leader>r", vim.lsp.buf.rename )
	set_map( "n", "<leader>q", vim.lsp.buf.code_action )
	set_map( "n", "<leader>h", vim.lsp.buf.hover, bufnr )
end

return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = false


		local _border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" }
		}

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		  opts = opts or {}
		  opts.border = opts.border or _border
		  return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		lspconfig.clangd.setup({
			on_attach = function( client, bufnr )
				vim.opt.shortmess = vim.opt.shortmess + "c"
				vim.opt.signcolumn = "yes"
				set_lsp_maps( client, bufnr )
			end,

			flags = {
				debounce_text_changes = 150,
			},

			capabilities = capabilities,

			cmd = {
				"clangd",
				"--clang-tidy",
				"--background-index",
				"--completion-style=bundled",
				"--all-scopes-completion",
				"--completion-style=detailed",
				"--fallback-style=webkit",
				"--malloc-trim",
				"--header-insertion-decorators",
				"--header-insertion=iwyu",
				"--cross-file-rename",
				"-j=8"
			},
		})

		lspconfig.pyright.setup({
			on_attach = function( client, bufnr ) set_lsp_maps( client, bufnr ) end
		})

		lspconfig.zls.setup({
			on_attach = function( client, bufnr ) set_lsp_maps( client, bufnr ) end
		})

		lspconfig.jsonls.setup({})

		lspconfig.ts_ls.setup({
			on_attach = function( client, bufnr ) set_lsp_maps( client, bufnr ) end
		})

		lspconfig.cmake.setup({
			on_attach = function( client, bufnr ) set_lsp_maps( client, bufnr ) end
		})
	end
}
