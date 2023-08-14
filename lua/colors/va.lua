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
		WinSeparator					{								fg = StatusLineNC.fg },
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
		Operator						{ 								fg = virus },
		Keyword							{								fg = sky_blue },
		Exception						{ bg = Conditional.bg,			fg = Conditional.fg },

		PreProc							{ 								fg = virus },
		Include							{ 								fg = gunmetal },
		Define							{ bg = Include.bg,				fg = Include.fg },
		Macro							{ bg = PreProc.bg,				fg = PreProc.fg },
		PreConduit						{ bg = Define.bg,				fg = Define.fg },

		Type							{ 								fg = dandelion },
		StorageClass					{								fg = Keyword.fg },
		Structure						{ bg = StorageClass.bg,			fg = StorageClass.fg },

		Search							{ bg = graphite,				fg = venom },
		IncSearch						{ bg = graphite,				fg = cote_dazur },

		ErrorMsg						{								fg = crimson,				gui = 'BOLD' },

		DiffAdd							{ bg = leaf,					fg = white },
		DiffDelete						{ bg = crimson.darken(15) },
		DiffChange						{ bg = pumpkin.darken(15),									gui = 'BOLD,ITALIC'},
		DiffText						{								fg = pumpkin,				gui = 'BOLD,ITALIC'},

		GitSignsAdd						{								fg = venom },
		GitSignsAddNr					{								fg = venom },
		GitSignsChange					{								fg = clownfish },
		GitSignsChangeNr				{								fg = clownfish },
		GitSignsDelete					{ 								fg = rosso_corsa },
		GitSignsDeleteNr				{ 								fg = rosso_corsa },
		GitSignsChangeddelete			{ 								fg = rosso_corsa,			gui = "ITALIC" },
		GitSignsChangeddeleteNr			{ 								fg = rosso_corsa,			gui = "ITALIC" },
		GitSignsCurrentLineBlame		{								fg = gunmetal },


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

		-- marks
		MarkSignHL						{								fg = kiwi },
		MarkSignNumHL					{								fg = kiwi },
		MarkVirtTextHL					{								fg = kiwi.darken(60) },

		-- XML specifics
		xmlAttrib						{								fg = sky_blue,				gui = 'ITALIC' },
		xmlEntity						{								fg = lavender },
		xmlEntityPunct					{								fg = lavender.darken(10)},
		xmlTag							{								fg = mahogany },
		xmlEndTag						{								fg = xmlTag.fg,				gui = 'BOLD' },
		xmlTagName						{								fg = clownfish },
		xmlString						{								fg = String.fg },

		-- Rainbow csv
		column0							{ bg = cloud,					fg = lead },
		column1							{ bg = graphite,				fg = cote_dazur },
		column2							{ bg = column0.bg, 				fg = column0.fg },
		column3							{ bg = column1.bg,				fg = column1.fg },
		column4							{ bg = column0.bg, 				fg = column0.fg },
		column5							{ bg = column1.bg,				fg = column1.fg },
		column6							{ bg = column0.bg, 				fg = column0.fg },
		column7							{ bg = column1.bg,				fg = column1.fg },
		column8							{ bg = column0.bg, 				fg = column0.fg },
		column9							{ bg = column1.bg,				fg = column1.fg },
		column10						{ bg = column0.bg, 				fg = column0.fg },
		column11						{ bg = column1.bg,				fg = column1.fg },
		column12						{ bg = column0.bg, 				fg = column0.fg },
		column13						{ bg = column1.bg,				fg = column1.fg },
		column14						{ bg = column0.bg, 				fg = column0.fg },
		column15						{ bg = column1.bg,				fg = column1.fg },
		column16						{ bg = column0.bg, 				fg = column0.fg },
		column17						{ bg = column1.bg,				fg = column1.fg },
		column18						{ bg = column0.bg, 				fg = column0.fg },
		column19						{ bg = column1.bg,				fg = column1.fg },
		column20						{ bg = column0.bg, 				fg = column0.fg },
		column21						{ bg = column1.bg,				fg = column1.fg },
		column22						{ bg = column0.bg, 				fg = column0.fg },
		column23						{ bg = column1.bg,				fg = column1.fg },
		column24						{ bg = column0.bg, 				fg = column0.fg },
		column25						{ bg = column1.bg,				fg = column1.fg },

		-- JSON
		jsonKeyword						{								fg = sky_blue	},
		jsonKeywordMatch				{								fg = sky_blue,			gui = 'UNDERLINE'	},


		-- Neorg
		sym"@neorg.markup.bold"			{ bg = normal.bg,				fg = normal.fg,			gui = 'BOLD'},
		sym"@neorg.markup.italic"		{ bg = normal.bg,				fg = normal.fg,			gui = 'ITALIC'},


		-- lsp
		sym"@lsp.type.class.cpp"		{								fg = dandelion },


		-- DAP UI
		DapStoppedLine			   		{								fg = crimson,			gui = ''},
		DapUIBreakpointsCurrentLine		{								fg = crimson,			gui = ''},
		DapUIBreakpointsInfo			{								fg = clownfish,			gui = ''},
		DapUIBreakpointsPath			{								fg = mocha,				gui = ''},
		DapUIDecoration					{								fg = gunmetal,			gui = ''},
		DapUIFloatBorder				{								fg = gunmetal,			gui = ''},
		DapUIFrameName					{								fg = clownfish,			gui = ''},
		DapUILineNumber					{								fg = heavy_cloud,		gui = ''},
		DapUIModifiedValue				{								fg = pinkface,			gui = ''},
		DapUIPlayPause					{								fg = venom,				gui = ''},
		DapUIRestart					{								fg = dandelion,			gui = ''},
		DapUIScope						{								fg = sky_blue,			gui = ''},
		DapUISource						{								fg = papaya,			gui = ''},
		DapUIStepBack					{								fg = venom,				gui = ''},
		DapUIStepInto					{								fg = venom,				gui = ''},
		DapUIStepOut					{								fg = venom,				gui = ''},
		DapUIStepOver					{								fg = venom,				gui = ''},
		DapUIStop						{								fg = crimson,			gui = ''},
		DapUIStoppedThread				{								fg = crimson,			gui = ''},
		DapUIThread						{								fg = jade,				gui = ''},
		DapUIType						{								fg = dandelion,			gui = ''},
		DapUIWatchesEmpty				{								fg = dust,				gui = ''},
		DapUIWatchesError				{								fg = rosso_corsa,		gui = ''},
		DapUIWatchesValue				{								fg = slate,				gui = ''},
		DapUIWinSelect			   		{								fg = turqoise,			gui = ''},
	} end)

	return qnrd_theme
	-- vi:nowrap:number
