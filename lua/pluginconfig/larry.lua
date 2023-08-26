require("larry").setup({
	available_presets = function( cwd )
			return { "clean", "test" }
		end,
	default_preset = "build",
})
