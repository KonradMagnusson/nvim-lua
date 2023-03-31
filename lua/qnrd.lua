local lush = require('lush')
local hsl = lush.hsl

-- Colors
local black 		= hsl("#000000")
local charcoal 		= hsl("#2c2c2c")
local lead			= hsl("#332c50")
local gunmetal 		= hsl("#8d918d")
local slate 		= hsl("#c8c8c8")
local white 		= hsl("#f0f0f0")

local virus 		= hsl("#a32da6")
local lavender 		= hsl("#d8a0df")
local sky_blue 		= hsl("#0078db")
local light_blue 	= hsl("#569cd6")
local jade			= hsl("#009393")
local cote_dazur 	= hsl("#00CCFF")
local cloud 		= hsl("#add8e6")
local mint			= hsl("#90ee90")
local venom 		= hsl("#00ff00")
local leaf			= hsl("#007700")
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

	Normal			{ bg = black,					fg = white },
	NormalFloat		{ bg = Normal.bg,				fg = Normal.fg },

	Pmenu			{ bg = charcoal,				fg = slate },
	PmenuSel		{ bg = lead,					fg = Normal.fg, gui = 'BOLD' },
	PmenuSbar		{ bg = charcoal },
	PmenuThumb		{ fg = gunmetal },

	Visual			{ bg = lead,					fg = sky_blue },
	VisualNOS		{ bg = Visual.bg,				fg = Visual.fg, gui = 'BOLD' },

	LineNr			{								fg = gunmetal },
	CursorLineNr	{								fg = slate },

	Cursor			{ bg = white,					fg = lead },
	CursorIM		{ bg = Cursor.bg,				fg = Cursor.fg },
	lCursor			{ bg = Cursor.bg,				fg = Cursor.fg },
	TermCursor		{ bg = Cursor.bg,				fg = Cursor.fg },
	TermCursorNC	{ bg = Cursor.bg,				fg = Cursor.fg },

	CursorLine		{ bg = Normal.bg.lighten(15) },
	CursorColumn	{ bg = CursorLine.bg },
	ColorColumn		{ bg = CursorLine.bg },

	SignColumn		{								fg = slate },
	StatusLine		{ bg = lead.darken(50),			fg = slate },
	ModeMsg			{ bg = StatusLine.bg,			fg = StatusLine.fg },

	Comment			{ bg = Normal.bg,				fg = Normal.fg.darken(60) },

	Constant		{ bg = Normal.bg,				fg = light_olive },
	Number			{ bg = Constant.bg,				fg = Constant.fg },
	String			{ bg = Constant.bg,				fg = light_mocha },
	Character		{ bg = String.bg,				fg = mocha },
	Boolean			{ bg = Constant.bg,				fg = jade },
	Float			{ bg = Number.bg,				fg = light_blue },

	Identifier		{ bg = Normal.bg,				fg = beige },
	Function		{ bg = Normal.bg,				fg = clownfish },
	Tag				{ bg = Function.bg,				fg = Function.fg, gui = 'BOLD'},

	Statement		{ bg = Normal.bg,				fg = lavender },
	Conditional		{ bg = Statement.bg,			fg = Statement.fg },
	Repeat			{ bg = Conditional.bg,			fg = Conditional.fg },
	Label			{ bg = Repeat.bg,				fg = Repeat.fg },
	Operator		{ bg = Normal.bg,				fg = sky_blue },
	Keyword			{ bg = Operator.bg,				fg = Operator.fg },
	Exception		{ bg = Conditional.bg,			fg = Conditional.fg },
	
	PreProc			{ bg = Normal.bg,				fg = virus },
	Include			{ bg = Normal.bg,				fg = gunmetal },
	Define			{ bg = Include.bg,				fg = Include.fg },
	Macro			{ bg = PreProc.bg,				fg = PreProc.fg },
	PreConduit		{ bg = Define.bg,				fg = Define.fg },
	
	Type			{ bg = Normal.bg,				fg = sky_blue },
	StorageClass	{ bg = Keyword.bg,				fg = Keyword.fg },
	Structure		{ bg = StorageClass.bg,			fg = StorageClass.fg },

	Search			{ bg = charcoal,				fg = venom },
	IncSearch		{ bg = charcoal,				fg = cote_dazur },

	DiffAdd			{ bg = leaf,					fg = white },
	DiffDelete		{ bg = crimson,					fg = lead },
	DiffChange		{ bg = pumpkin,					fg = lead },
	DiffText		{ gui = 'BOLD,ITALIC'},

	Directory		{								fg = jade},

	-- TODO: populate with nice treesitter colors!
	sym"@type"		{								fg = dandelion}

} end)

return qnrd_theme
-- vi:nowrap:number
