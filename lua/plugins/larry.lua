return {
	"konradmagnusson/larry",

	dev = false,

	dependencies = {
		"rcarriga/nvim-notify",
		"norcalli/nvim-terminal.lua",
	},

	opts = {
		available_presets = function(cwd)
			return {
				"qnrd-ReleaseLto",
				"qnrd-ReleaseOpt",
				"qnrd-Release",
				"qnrd-DebugOpt",
				"qnrd-Debug",

				"qnrd-tracy-ReleaseLto",
				"qnrd-tracy-ReleaseOpt",
				"qnrd-tracy-Release",
				"qnrd-tracy-DebugOpt",
				"qnrd-tracy-Debug",
			}
		end,

		default_preset = "qnrd-Debug"
	}
}
