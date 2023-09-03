return {
	"konradmagnusson/larry",

	dev = true,

	dependencies = {
		"rcarriga/nvim-notify",
	},

	opts = {
		available_presets = function(cwd)
			return {
				"linux-clang-ReleaseLto",
				"linux-clang-ReleaseOpt",
				"linux-clang-Release",
				"linux-clang-DebugOpt",
				"linux-clang-Debug",

				"good-clang-ReleaseLto",
				"good-clang-ReleaseOpt",
				"good-clang-Release",
				"good-clang-DebugOpt",
				"good-clang-Debug",

				"qnrd-ReleaseLto",
				"qnrd-ReleaseOpt",
				"qnrd-Release",
				"qnrd-DebugOpt",
				"qnrd-Debug",
			}
		end,

		default_preset = "qnrd-Debug"
	}
}
