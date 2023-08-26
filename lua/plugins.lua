local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	})
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use "konradmagnusson/larry"
	use "wbthomason/packer.nvim"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip"
	use "L3MON4D3/LuaSnip"
	use "nvim-tree/nvim-web-devicons"
	use "folke/trouble.nvim"
	use "folke/neodev.nvim"
	use "nvim-lua/plenary.nvim"
	use "RRethy/vim-illuminate"
	use "akinsho/toggleterm.nvim"
	use "tpope/vim-repeat"
	use "ggandor/leap.nvim"
	use "klen/nvim-config-local"
	use "stevearc/dressing.nvim"
	use "rcarriga/nvim-notify"
	use "eandrju/cellular-automaton.nvim"
	use "rktjmp/lush.nvim"
	use "johnfrankmorgan/whitespace.nvim"
	use "lewis6991/gitsigns.nvim"
	use "mechatroner/rainbow_csv"
	use "chentoast/marks.nvim"

	-- treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true
			})
			ts_update()
		end,
	}
	use "nvim-treesitter/playground"

	-- telescope
	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim" },
	}
	use "nvim-telescope/telescope-symbols.nvim"
	use "FeiyouG/command_center.nvim"

	-- dap
	use "mfussenegger/nvim-dap"
	use "mfussenegger/nvim-dap-python"
	use "theHamsta/nvim-dap-virtual-text"
	use {
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
	}

	-- neorg
	use {
		"nvim-neorg/neorg",
		config = function()
			require('neorg').setup {
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/notes",
							},
						},
					},
				},
			}
		end,
		run = ":Neorg sync-parsers",
		requires = "nvim-lua/plenary.nvim",
	}

	if packer_bootstrap then
		require("packer").sync()
	end
end)
