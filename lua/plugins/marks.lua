return {
	"chentoast/marks.nvim",
	opts = {
		default_mappings = true,
		cyclic = true,
		force_write_shada = true,
		refresh_interval = 250,
		sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
		excluded_filetypes = {},
		bookmark_1 = { sign = "1" },
		bookmark_2 = { sign = "2" },
		bookmark_3 = { sign = "3" },
		bookmark_4 = { sign = "4" },
		bookmark_5 = { sign = "5" },
		bookmark_6 = { sign = "6" },
		bookmark_7 = { sign = "7" },
		bookmark_8 = { sign = "8" },
		bookmark_9 = { sign = "9" },
		bookmark_0 = { sign = "0" },

		mappings = {
			delete_bookmark = "dM",
			next = "mn",
			prev = "mN",
			annotate = "ma",
		}
	}
}
