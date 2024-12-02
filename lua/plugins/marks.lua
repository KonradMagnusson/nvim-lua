return {
	"chentoast/marks.nvim",
	opts = {
		default_mappings = true,
		cyclic = true,
		force_write_shada = true,
		refresh_interval = 250,
		sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
		excluded_filetypes = {},
		bookmark_1 = { sign = "①" },
		bookmark_2 = { sign = "②" },
		bookmark_3 = { sign = "③" },
		bookmark_4 = { sign = "④" },
		bookmark_5 = { sign = "⑤" },
		bookmark_6 = { sign = "⑥" },
		bookmark_7 = { sign = "⑦" },
		bookmark_8 = { sign = "⑧" },
		bookmark_9 = { sign = "⑨" },
		bookmark_0 = { sign = "⑩" },

		mappings = {
			delete_bookmark = "dM",
			next = "mn",
			prev = "mN",
			annotate = "ma",
		}
	}
}
