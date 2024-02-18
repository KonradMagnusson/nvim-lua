return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()


		local _border = "single"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
		  vim.lsp.handlers.hover, {
			border = _border
		  }
		)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		  vim.lsp.handlers.signature_help, {
			border = _border
		  }
		)
		vim.diagnostic.config{
		  float={border=_border}
		}
		require("lspconfig.ui.windows").default_options = {
			border = _border
		}


		lspconfig.clangd.setup({
			on_attach = function(client, bufnr)
				require("clangd_extensions.inlay_hints").setup_autocmd()
				require("clangd_extensions.inlay_hints").set_inlay_hints()
				vim.opt.cmdheight = 2
				vim.opt.updatetime = 300
				vim.opt.shortmess = vim.opt.shortmess + "c"
				vim.opt.signcolumn = "yes"

				-- code navigation
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<CMD>Telescope lsp_definitions<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "go", "<CMD>ClangdSwitchSourceHeader<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<CMD>Telescope lsp_type_definitions<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<CMD>Telescope lsp_references<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "g?", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>s", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>m", "<CMD>Telescope lsp_document_symbols<CR>", { noremap = true })

				-- edit actions
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<CMD>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<CMD>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>h", "<CMD>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
			end,

			flags = {
				debounce_text_changes = 150,
			},

			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),

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
				"--header-insertion=iwyu"
			},
		})

		lspconfig.pyright.setup({})

		lspconfig.zls.setup({})

	end
}
