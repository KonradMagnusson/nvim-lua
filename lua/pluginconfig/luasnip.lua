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
        }),
    },
})
