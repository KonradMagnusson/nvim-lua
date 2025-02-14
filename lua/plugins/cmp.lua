return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"lukas-reineke/cmp-under-comparator",
		"ofirgall/cmp-lspkind-priority"
	},

	init = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind_priority = require('cmp-lspkind-priority')
		lspkind_priority.setup {
			-- Default priority by nvim-cmp
			priority = {
				'Snippet',
				'Variable',
				'Method',
				'Function',
				'Constructor',
				'Property',
				'Field',
				'Class',
				'Interface',
				'Module',
				'Unit',
				'Value',
				'Enum',
				'Keyword',
				'Color',
				'File',
				'Reference',
				'Folder',
				'EnumMember',
				'Constant',
				'Struct',
				'Event',
				'Operator',
				'TypeParameter',
				'Text',
			}
		}
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = {
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<Esc>"] = cmp.mapping(function()
						cmp.mapping.abort()
						vim.cmd("stopinsert")
				end),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end),
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip", option = { show_autosnippets = true } },
			}),
			sorting = {
				comparators = {
					lspkind_priority.compare,
					cmp.config.compare.locality,
					cmp.config.compare.exact,
					cmp.config.compare.offset,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					require("cmp-under-comparator").under,
				}
			},
		})
	end
}
