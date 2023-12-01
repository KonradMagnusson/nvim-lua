local function setup_snippets()
	local ls = require("luasnip")
	local snip = ls.snippet
	local text = ls.text_node

	ls.add_snippets(nil, {
		cpp = {
			snip({
				trig = "forderef",
				name = "(for) dereferenced pointers",
				dscr = "for X in PdxDerefPointers( Y )",
			}, {
				text({"for ( <++> : PdxDerefPointers( <++> ) )", ""}),
				text({"{", ""}),
				text({"\t<++>", ""}),
				text({"}", ""}),
				text({"<++>", ""}),
			})
		}
	})
end



return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		setup_snippets()
		require("luasnip.loaders.from_vscode").load({ paths = { "/home/qnrd/k/snippets" } })
	end
}
