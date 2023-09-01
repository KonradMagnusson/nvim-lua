require("larry").setup({
	available_presets = function( cwd )
			return { "good-clang-ReleaseOpt", "good-clang-Debug", "good-clang-DebugOpt" }
		end,
	default_preset = "good-clang-ReleaseOpt",
})
