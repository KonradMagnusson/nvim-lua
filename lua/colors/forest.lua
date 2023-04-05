local lush = require('lush')
local hsl = lush.hsl

-- Colors
local black					= hsl("#000000")
local charcoal				= hsl("#151515")
local graphite 				= hsl("#2c2c2c")
local lead					= hsl("#332c50")
local heavy_cloud			= hsl("#706b66")
local gunmetal 				= hsl("#8d918d")
local dust					= hsl("#a89f94")
local slate 				= hsl("#c8c8c8")
local white 				= hsl("#f0f0f0")

local virus 				= hsl("#a32da6")
local pinkface				= hsl("#FF00FF")
local lavender 				= hsl("#d8a0df")
local matte_sapphire		= hsl("#5f87d7")
local morning_sky			= hsl("#2d93dd")
local light_blue 			= hsl("#569cd6")
local sky_blue 				= hsl("#0078db")
local sage					= hsl("#5a857a")
local blue_clay				= hsl("#46878f")
local jade					= hsl("#009393")
local turqoise				= hsl("#20b0c0")
local cote_dazur 			= hsl("#00CCFF")
local cloud 				= hsl("#add8e6")
local mint					= hsl("#90ee90")
local kiwi					= hsl("#94e344")
local venom 				= hsl("#00ff00")
local cactus				= hsl("#426e5d")
local leaf					= hsl("#007700")
local faded_green			= hsl("#77af68")
local moss					= hsl("#6b8c42")
local olive					= hsl("#95ae88")
local light_olive 			= hsl("#b5cea8")
local beige 				= hsl("#e9d798")
local light_mocha 			= hsl("#d69d85")
local mocha 				= hsl("#ab654b")
local mahogany 				= hsl("#954a4a")
local crimson				= hsl("#dc143c")
local rosso_corsa			= hsl("#D70000")
local pumpkin				= hsl("#d75f00")
local papaya				= hsl("#d78700")
local clownfish 			= hsl("#ff8000")
local dandelion 			= hsl("#ffff00")



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

		Constant						{ 								fg = moss },
		Number							{ bg = Constant.bg,				fg = Constant.fg },
		String							{ bg = Constant.bg,				fg = dust },
		Character						{ bg = String.bg,				fg = blue_clay },
		Boolean							{ bg = Constant.bg,				fg = jade,					gui = 'ITALIC' },
		Float							{ bg = Number.bg,				fg = matte_sapphire },

		Identifier						{ 								fg = moss },
		Function						{ 								fg = turqoise,				gui = 'BOLD' },
		Tag								{ bg = Function.bg,				fg = Function.fg,			gui = 'BOLD' },

		Statement						{ 								fg = sage,					gui = 'BOLD' },
		Conditional						{ bg = Statement.bg,			fg = Statement.fg,			gui = 'BOLD' },
		Repeat							{ bg = Conditional.bg,			fg = Conditional.fg,		gui = 'BOLD' },
		Label							{ bg = Repeat.bg,				fg = Repeat.fg,				gui = 'BOLD' },
		Operator						{ 								fg = sage },
		Keyword							{ bg = Statement.bg,			fg = Statement.fg,			gui = 'ITALIC' },
		Exception						{								fg = rosso_corsa },

		PreProc							{ 								fg = heavy_cloud },
		Include							{ 								fg = cactus },
		Define							{ bg = Include.bg,				fg = Include.fg },
		Macro							{ bg = PreProc.bg,				fg = PreProc.fg },
		PreConduit						{ bg = Define.bg,				fg = Define.fg },

		Type							{ 								fg = faded_green,			gui = 'BOLD' },
		StorageClass					{								fg = morning_sky },
		Structure						{								fg = moss },

		Search							{ bg = graphite,				fg = venom },
		IncSearch						{ bg = graphite,				fg = cote_dazur },

		ErrorMsg						{								fg = crimson,				gui = 'BOLD' },

		DiffAdd							{ bg = leaf,					fg = white },
		DiffDelete						{ bg = crimson,					fg = lead },
		DiffChange						{ bg = pumpkin,					fg = lead },
		DiffText						{ gui = 'BOLD,ITALIC'},

		Directory						{								fg = jade },

		-- TODO: populate with nice treesitter colors!
		sym"@type"						{								fg = Type.fg },
		sym"@type.builtin"				{ 								fg = sky_blue },
		sym"@type.qualifier"			{ 								fg = sky_blue },
		sym"@punctuation"				{ 								fg = slate },
		sym"@punctuation.bracket"		{ 								fg = slate },
		sym"@preproc"					{								fg = Include.fg },
		sym"@namespace"					{								fg = cloud,					gui = 'ITALIC' },
		sym"@variable"					{								fg = Identifier.fg,			gui = 'BOLD' },
		sym"@text.literal"				{								fg = String.fg },
		sym"@conditional.ternary"		{								fg = cote_dazur },
		sym"@function"					{ bg = Function.bg,				fg = Function.fg,			gui = Function.gui },
		sym"@function.builtin"			{ bg = Function.bg,				fg = Function.fg,			gui = Function.gui .. ',ITALIC' },
		sym"@constant.builtin"			{								fg = moss,					gui = 'ITALIC,BOLD' },
		sym"@variable.builtin"			{								fg = moss,					gui = 'ITALIC' },

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
		rainbowcol3						{								fg = mint },
		rainbowcol4						{								fg = cote_dazur },
		rainbowcol5						{},
		rainbowcol6						{								fg = sky_blue },
		rainbowcol7						{},

	} end)

	return qnrd_theme
	-- vi:nowrap:number
