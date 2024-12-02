return {
	"hedyhli/outline.nvim",
	opts = {
		outline_window = {
			position = 'left',
			split_command = nil,
			width = 20,
			relative_width = true,
			auto_close = false,
			auto_jump = false,
			jump_highlight_duration = 300,
			center_on_jump = true,
			show_numbers = false,
			show_relative_numbers = false,
			wrap = false,
			show_cursorline = true,
			hide_cursor = false,
			focus_on_open = false,
			winhl = '',
		},

		outline_items = {
			show_symbol_details = true,
			show_symbol_lineno = false,
			highlight_hovered_item = true,
			auto_set_cursor = true,
			auto_update_events = {
				follow = { 'CursorMoved' },
				items = { 'InsertLeave', 'WinEnter', 'BufEnter', 'BufWinEnter', 'TabEnter', 'BufWritePost' },
			},
		},

		guides = {
			enabled = true,
			markers = {
				bottom = '└',
				middle = '├',
				vertical = '│',
			},
		},

		symbol_folding = {
			autofold_depth = 1,
			auto_unfold = {
				hovered = true,
				only = true,
			},
			markers = { '', '' },
		},

		preview_window = {
			auto_preview = false,
			open_hover_on_preview = false,
			width = 50,
			min_width = 50,
			relative_width = true,
			border = 'single',
			winhl = 'NormalFloat:',
			winblend = 0,
			live = false
		},

		keymaps = {
			show_help = '?',
			close = {'<Esc>', 'q'},
			goto_location = '<CR>',
			peek_location = 'o',
			goto_and_close = '<S-CR>',
			restore_location = '<C-g>',
			hover_symbol = '<C-space>',
			toggle_preview = 'K',
			rename_symbol = 'r',
			code_actions = 'a',
			fold = 'j',
			unfold = 'ö',
			fold_toggle = '<Tab>',
			fold_toggle_all = '<S-Tab>',
			fold_all = 'W',
			unfold_all = 'E',
			fold_reset = 'R',
			down_and_jump = '<C-k>',
			up_and_jump = '<C-l>',
		},

		providers = {
			priority = { 'lsp', 'coc', 'markdown', 'norg' },
			lsp = {
				blacklist_clients = {},
			},
			markdown = {
				filetypes = {'markdown'},
			},
		},

		symbols = {
			filter = nil,
			icon_fetcher = nil,
			icon_source = nil,
			icons = {
				File = { icon = '󰈔', hl = 'Identifier' },
				Module = { icon = '󰆧', hl = 'Include' },
				Namespace = { icon = '󰅪', hl = 'Include' },
				Package = { icon = '󰏗', hl = 'Include' },
				Class = { icon = '𝓒', hl = 'Type' },
				Method = { icon = 'ƒ', hl = 'Function' },
				Property = { icon = '', hl = 'Identifier' },
				Field = { icon = '󰆨', hl = 'Identifier' },
				Constructor = { icon = '', hl = 'Special' },
				Enum = { icon = 'ℰ', hl = 'Type' },
				Interface = { icon = '󰜰', hl = 'Type' },
				Function = { icon = '', hl = 'Function' },
				Variable = { icon = '', hl = 'Constant' },
				Constant = { icon = '', hl = 'Constant' },
				String = { icon = '𝓐', hl = 'String' },
				Number = { icon = '#', hl = 'Number' },
				Boolean = { icon = '⊨', hl = 'Boolean' },
				Array = { icon = '󰅪', hl = 'Constant' },
				Object = { icon = '⦿', hl = 'Type' },
				Key = { icon = '🔐', hl = 'Type' },
				Null = { icon = 'NULL', hl = 'Type' },
				EnumMember = { icon = '', hl = 'Identifier' },
				Struct = { icon = '𝓢', hl = 'Structure' },
				Event = { icon = '🗲', hl = 'Type' },
				Operator = { icon = '+', hl = 'Identifier' },
				TypeParameter = { icon = '𝙏', hl = 'Identifier' },
				Component = { icon = '󰅴', hl = 'Function' },
				Fragment = { icon = '󰅴', hl = 'Constant' },
				TypeAlias = { icon = ' ', hl = 'Type' },
				Parameter = { icon = ' ', hl = 'Identifier' },
				StaticMethod = { icon = ' ', hl = 'Function' },
				Macro = { icon = ' ', hl = 'Function' },
			},
		}
	}
}
