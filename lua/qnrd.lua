local lush = require('lush')
local hsl = lush.hsl

-- Colors
local black 		= hsl("#000000")
local charcoal		= hsl("#151515")
local graphite 		= hsl("#2c2c2c")
local lead			= hsl("#332c50")
local gunmetal 		= hsl("#8d918d")
local slate 		= hsl("#c8c8c8")
local white 		= hsl("#f0f0f0")

local virus 		= hsl("#a32da6")
local pinkface		= hsl("#FF00FF")
local lavender 		= hsl("#d8a0df")
local sky_blue 		= hsl("#0078db")
local light_blue 	= hsl("#569cd6")
local jade			= hsl("#009393")
local cote_dazur 	= hsl("#00CCFF")
local cloud 		= hsl("#add8e6")
local mint			= hsl("#90ee90")
local venom 		= hsl("#00ff00")
local leaf			= hsl("#007700")
local olive			= hsl("#95ae88")
local light_olive 	= hsl("#b5cea8")
local beige 		= hsl("#e9d798")
local light_mocha 	= hsl("#d69d85")
local mocha 		= hsl("#ab654b")
local mahogany 		= hsl("#954a4a")
local crimson		= hsl("#dc143c")
local clownfish 	= hsl("#ff8000")
local pumpkin		= hsl("#d75f00")
local dandelion 	= hsl("#ffff00")




local qnrd_theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {

		Normal							{ bg = charcoal,				fg = white },
		NormalFloat						{ bg = Normal.bg,				fg = Normal.fg },

		Pmenu							{ bg = graphite,				fg = slate },
		PmenuSel						{ bg = lead,					fg = Normal.fg,				gui = 'BOLD' },
		PmenuSbar						{ bg = graphite },
		PmenuThumb						{ fg = gunmetal },

		Visual							{ bg = lead,					fg = sky_blue },
		VisualNOS						{ bg = Visual.bg,				fg = Visual.fg,				gui = 'BOLD' },

		Folded							{ bg = graphite,				fg = gunmetal},
		FoldedColumn					{ bg = Folded.bg,				fg = Folded.fg},

		LineNr							{								fg = gunmetal },
		CursorLineNr					{								fg = slate },

		Cursor							{ bg = white,					fg = lead },
		CursorIM						{ bg = Cursor.bg,				fg = Cursor.fg },
		lCursor							{ bg = Cursor.bg,				fg = Cursor.fg },
		TermCursor						{ bg = Cursor.bg,				fg = Cursor.fg },
		TermCursorNC					{ bg = Cursor.bg,				fg = Cursor.fg },

		CursorLine						{ bg = Normal.bg.lighten(5) },
		CursorColumn					{ bg = CursorLine.bg },
		ColorColumn						{ bg = CursorLine.bg },

		SignColumn						{								fg = slate },
		StatusLine						{ bg = lead.darken(50),			fg = slate },
		StatusLineNC					{ bg = lead.darken(75),			fg = slate },
		WinSeparator					{ bg = StatusLineNC.bg,			fg = StatusLineNC.bg },
		ModeMsg							{ bg = StatusLine.bg,			fg = StatusLine.fg },

		EndOfBuffer						{								fg = lead },
		NonText							{								fg = graphite.darken(20) },
		Whitespace						{								fg = NonText.fg },

		Comment							{ 								fg = Normal.fg.darken(60) },

		Constant						{ 								fg = light_olive },
		Number							{ bg = Constant.bg,				fg = Constant.fg },
		String							{ bg = Constant.bg,				fg = light_mocha },
		Character						{ bg = String.bg,				fg = mocha },
		Boolean							{ bg = Constant.bg,				fg = jade },
		Float							{ bg = Number.bg,				fg = light_blue },

		Identifier						{ 								fg = beige },
		Function						{ 								fg = clownfish },
		Tag								{ bg = Function.bg,				fg = Function.fg,			gui = 'BOLD'},

		Statement						{ 								fg = lavender },
		Conditional						{ bg = Statement.bg,			fg = Statement.fg },
		Repeat							{ bg = Conditional.bg,			fg = Conditional.fg },
		Label							{ bg = Repeat.bg,				fg = Repeat.fg },
		Operator						{ 								fg = sky_blue },
		Keyword							{ bg = Operator.bg,				fg = Operator.fg },
		Exception						{ bg = Conditional.bg,			fg = Conditional.fg },

		PreProc							{ 								fg = virus },
		Include							{ 								fg = gunmetal },
		Define							{ bg = Include.bg,				fg = Include.fg },
		Macro							{ bg = PreProc.bg,				fg = PreProc.fg },
		PreConduit						{ bg = Define.bg,				fg = Define.fg },

		Type							{ 								fg = sky_blue },
		StorageClass					{ bg = Keyword.bg,				fg = Keyword.fg },
		Structure						{ bg = StorageClass.bg,			fg = StorageClass.fg },

		Search							{ bg = graphite,				fg = venom },
		IncSearch						{ bg = graphite,				fg = cote_dazur },

		ErrorMsg						{								fg = crimson,				gui = 'BOLD' },

		DiffAdd							{ bg = leaf,					fg = white },
		DiffDelete						{ bg = crimson,					fg = lead },
		DiffChange						{ bg = pumpkin,					fg = lead },
		DiffText						{ gui = 'BOLD,ITALIC'},

		Directory						{								fg = jade },

		-- TODO: populate with nice treesitter colors!
		sym"@type"						{								fg = dandelion },
		sym"@type.builtin"				{ 								fg = sky_blue },
		sym"@type.qualifier"			{ 								fg = sky_blue },
		sym"@punctuation"				{ 								fg = slate },
		sym"@punctuation.bracket"		{ 								fg = slate },
		sym"@preproc"					{								fg = Include.fg },
		sym"@namespace"					{								fg = cloud },
		sym"@variable"					{								fg = Identifier.fg },
		sym"@text.literal"				{								fg = String.fg },
		sym"@conditional.ternary"		{								fg = crimson },

		-- some random ass custom ones..?
		ClassName						{								fg = sym"@type".fg},
		StructName						{								fg = ClassName.fg},
		UnionName						{								fg = ClassName.fg},
		Enumerator						{								fg = virus },
		EnumerationName					{								fg = mahogany },
		FunctionPrototype				{								fg = Function.fg },
		TypeDef							{								fg = ClassName.fg },
		Variable						{								fg = light_olive },
		FileName						{								fg = String.fg },
		

		-- Rainbow parenteses
		rainbowcol1						{								fg = sym"@punctuation".fg},
		rainbowcol2						{								fg = olive },
		rainbowcol3						{								fg = dandelion },
		rainbowcol4						{								fg = cote_dazur },
		rainbowcol5						{},
		rainbowcol6						{},
		rainbowcol7						{},

	} end)

	return qnrd_theme
	-- vi:nowrap:number
