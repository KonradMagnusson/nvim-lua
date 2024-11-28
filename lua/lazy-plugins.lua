local plugins = require("plugins")
local opts = {
	root = vim.fn.stdpath("data") .. "/lazy",
	defaults = {
		lazy = false,
		version = nil,
		cond = nil,
	},
	spec = nil,
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
	concurrency = jit.os:find("Windows") and (vim.loop.available_parallelism() * 2) or nil,
	git = {
		log = { "-8" },
		timeout = 120,
		url_format = "https://github.com/%s.git",
		filter = true,
	},
	dev = {
		path = "~/k",
		patterns = {"qnrd"}, -- For example {"folke"}
		fallback = false,
	},
	install = {
		missing = true,
		colorscheme = { "habamax" },
	},
	ui = {
		size = { width = 0.8, height = 0.8 },
		wrap = true,
		border = "rounded",
		title = nil,
		title_pos = "center",
		pills = true,
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		},
		browser = "/usr/bin/firefox",
		throttle = 20,
		custom_keys = {
			-- open lazygit log
			["<localleader>l"] = function(plugin)
				require("lazy.util").float_term({ "lazygit", "log" }, {
					cwd = plugin.dir,
				})
			end,

			-- open a terminal for the plugin dir
			["<localleader>t"] = function(plugin)
				require("lazy.util").float_term(nil, {
					cwd = plugin.dir,
				})
			end,
		},
	},
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = "git",
	},
	checker = {
		enabled = false,
		concurrency = 16,
		notify = true,
		frequency = 3600,
	},
	change_detection = {
		enabled = true,
		notify = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = {},
			disabled_plugins = {
			},
		},
	},
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "README.rtf", "lua/**/README.md" },
		skip_if_doc_exists = true,
	},
	state = vim.fn.stdpath("state") .. "/lazy/state.json",
	build = {
		warn_on_override = true,
	},

}

require("lazy").setup(plugins, opts)
