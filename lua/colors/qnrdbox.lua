local lush = require('lush')
local hsl = lush.hsl


local Colors = {
	black					= hsl("#000000"),
	charcoal				= hsl("#151515"),
	graphite 				= hsl("#2c2c2c"),
	heavy_cloud				= hsl("#706b66"),
	gunmetal 				= hsl("#8d918d"),
	dust					= hsl("#a89f94"),
	slate					= hsl("#c8c8c8"),
	white					= hsl("#f0f0f0"),
	whiter					= hsl("#ffffff"),

	lead					= hsl("#332c50"),
	virus					= hsl("#a32da6"),
	lilac					= hsl("#b463b8"),
	pinkface				= hsl("#FF00FF"),
	lavender 				= hsl("#d8a0df"),
	chambray				= hsl("#354f9c"),
	matte_sapphire			= hsl("#5f87d7"),
	light_blue 				= hsl("#569cd6"),
	morning_sky				= hsl("#2d93dd"),
	sky_blue 				= hsl("#0078db"),
	cactus					= hsl("#426e5d"),
	sage					= hsl("#5a857a"),
	blue_clay				= hsl("#46878f"),
	jade					= hsl("#009393"),
	turqoise				= hsl("#20b0c0"),
	cote_dazur				= hsl("#00CCFF"),
	cloud					= hsl("#add8e6"),
	mint					= hsl("#90ee90"),
	kiwi					= hsl("#94e344"),
	venom					= hsl("#00ff00"),
	leaf					= hsl("#007700"),
	faded_green				= hsl("#77af68"),
	moss					= hsl("#6b8c42"),
	olive					= hsl("#95ae88"),
	light_olive 			= hsl("#b5cea8"),
	beige					= hsl("#e9d798"),
	piggy					= hsl("#FBAA8C"),
	light_mocha 			= hsl("#d69d85"),
	mocha					= hsl("#ab654b"),
	mahogany 				= hsl("#954a4a"),
	indian_red				= hsl("#CD5C5C"),
	burgundy				= hsl("#840000"),
	rosso_corsa				= hsl("#D70000"),
	crimson					= hsl("#dc143c"),
	pumpkin					= hsl("#d75f00"),
	clownfish 				= hsl("#ff8000"),
	papaya					= hsl("#d78700"),
	school_bus				= hsl("#ef8e00"),
	ripe_lemon				= hsl("#f4d81c"),
	dandelion 				= hsl("#ffff00"),
}

local NoFmt = ''

local FontMods = {
	B = 'bold',
	U = 'underline',
	I = 'italic',
	BU = 'bold,underline',
	BI = 'bold,italic',
	UI = 'underline,italic',
	BUI = 'bold,underline,italic',
}

local Palette = {
	Bg = Colors.charcoal,

	Fg = Colors.white,

	Hint = Colors.heavy_cloud,
	Info = Colors.kiwi,
	Warn = Colors.pumpkin,
	Error = Colors.rosso_corsa,
	Success = Colors.venom,

	DiffAddFg = Colors.venom,
	DiffAddBg = Colors.charcoal,
	DiffChangeFg = Colors.papaya,
	DiffChangeBg = Colors.charcoal,
	DiffDeleteFg = Colors.crimson,
	DiffDeleteBg = Colors.charcoal,

	NormalFg = Colors.white,
	NormalBg = Colors.charcoal,
	DarkFg = Colors.white.darken(25),
	DarkBg = Colors.lead.darken(75),
}

local Q = {
	Active = {
		Text = { Fg = Palette.NormalFg, Bg = Palette.NormalBg, Gui = NoFmt },
		--Border = { Fg = Colors.slate, Bg = Colors.lead.darken(75), Gui = NoFmt },
		Border = { Fg = Colors.slate, Bg = Palette.Bg, Gui = NoFmt },
		Scroll = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
	},
	Inactive = {
		Text = { Fg = Palette.DarkFg, Bg = Palette.NormalBg, Gui = NoFmt },
		--Border = { Fg = Colors.graphite, Bg = Colors.lead.darken(75), Gui = NoFmt },
		Border = { Fg = Colors.graphite.lighten(20), Bg = Palette.Bg, Gui = NoFmt },
		Scroll = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
	},
	Menu = {
		Inactive = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
		Active = { Fg = Colors.white, Bg = Colors.lead, Gui = FontMods.B },
	},
	Standout = { Fg = Colors.turqoise, Bg = NoFmt, Gui = NoFmt },
	Unimportant = { Fg = Colors.heavy_cloud, Bg = Palette.NormalBg },
	Highlight = { Fg = Colors.cote_dazur, Bg = Colors.gunmetal.darken(35), Gui = FontMods.BI },
	Selected = { Fg = Colors.cloud, Bg = Colors.lead, Gui = NoFmt },


	Comment				= { Fg = Colors.heavy_cloud,
							Bg = NoFmt,
							Gui = NoFmt },
	Number				= { Fg = Colors.cloud,
							Bg = NoFmt,
							Gui = NoFmt },
	String				= { Fg = Colors.light_mocha,
							Bg = NoFmt,
							Gui = NoFmt },
	Type			= { Fg = Colors.matte_sapphire,
							Bg = NoFmt,
							Gui = NoFmt },
	Class				= { Fg = Colors.blue_clay,
							Bg = NoFmt,
							Gui = FontMods.B },
	Boolean				= { Fg = Colors.indian_red,
							Bg = NoFmt,
							Gui = NoFmt },
	Identifier			= { Fg = Colors.light_olive,
							Bg = NoFmt,
							Gui = NoFmt },
	Function			= { Fg = Colors.kiwi,
							Bg = NoFmt,
							Gui = NoFmt },
	Statement				= { Fg = Colors.indian_red,
							Bg = NoFmt,
							Gui = NoFmt },
	Conditional			= { Fg = Colors.pumpkin,
							Bg = NoFmt,
							Gui = NoFmt },
	Loop				= { Fg = Colors.pumpkin,
							Bg = NoFmt,
							Gui = NoFmt },
	Operator			= { Fg = Colors.cloud,
							Bg = NoFmt,
							Gui = NoFmt },
	CPP					= { Fg = Colors.moss,
							Bg = NoFmt,
							Gui = FontMods.B },
	Macro					= { Fg = Colors.school_bus,
							Bg = NoFmt,
							Gui = FontMods.B },
	Enum				= { Fg = Colors.sky_blue.darken(10),
							Bg = NoFmt,
							Gui = FontMods.B },
	Constant			= { Fg = Colors.turqoise,
							Bg = NoFmt,
							Gui = FontMods.I },


	XMLEven = { Fg = Colors.jade, Bg = Colors.charcoal, Gui = NoFmt },
	XMLOdd = { Fg = Colors.white, Bg = Colors.graphite, Gui = NoFmt },
}

local qnrd_theme = lush( function(injected_functions)
	local sym = injected_functions.sym
	return {
		Normal							{ fg = Q.Active.Text.Fg, bg = Q.Active.Text.Bg, gui = Q.Active.Text.Gui },
		NormalFloat						{ fg = Q.Active.Text.Fg },
		FloatBorder						{ fg = Q.Active.Border.Fg, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		Title							{ fg = Q.Active.Border.Fg, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		FloatTitle						{ fg = Q.Active.Border.Fg, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		NormalNC						{ fg = Q.Inactive.Text.Fg, bg = Q.Inactive.Text.Bg, gui = Q.Inactive.Text.Gui },

		Pmenu							{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuSel						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuKind						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuExtra						{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuExtraSel					{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuSbar						{ fg = Q.Active.Scroll.Fg,	bg = Q.Active.Scroll.Bg,	gui = Q.Active.Scroll.Gui },
		PmenuThumb						{ fg = Q.Active.Scroll.Bg,	bg = Q.Active.Scroll.Fg,	gui = Q.Active.Scroll.Gui },

		Question						{ fg = Palette.Hint },
		QuickFixLine					{ fg = Q.Menu.Active.Fg, bg = Q.Menu.Active.Bg, gui = Q.Menu.Active.Gui },

		Search							{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,			gui = Q.Highlight.Gui },
		IncSearch						{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,			gui = Q.Highlight.Gui },

		Visual							{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },

		Folded							{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg },
		FoldedColumn					{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg },

		LineNr							{ fg = Colors.gunmetal,		bg = Q.Active.Border.Bg,	gui = Q.Active.Border.Gui },
		CursorLineNr					{ fg = Q.Menu.Active.Fg,	bg = Q.Active.Border.Bg,	gui = Q.Menu.Active.Gui },
		LineNrBelow						{ fg = Colors.mahogany,		bg = Q.Active.Border.Bg,	gui = Q.Active.Border.Gui },
		LineNrAbove						{ fg = Colors.cactus,		bg = Q.Active.Border.Bg,	gui = Q.Active.Border.Gui },

		Cursor							{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },
		TermCursor						{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },
		TermCursorNC					{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },

		CursorLine						{ bg = Q.Active.Text.Bg.lighten(5) },

		CursorColumn					{ bg = Q.Active.Text.Bg.lighten(5) },
		ColorColumn						{ bg = Q.Active.Text.Bg.lighten(5) },

		SignColumn						{ fg = Colors.graphite, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		FoldColumn						{ fg = Colors.graphite, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		StatusLine						{ fg = Q.Active.Border.Fg, bg = Q.Active.Border.Bg, gui = Q.Active.Border.Gui },
		StatusLineNC					{ fg = Q.Inactive.Border.Fg, bg = Q.Inactive.Border.Bg.darken(20), gui = Q.Inactive.Border.Gui },
		WinSeparator					{ fg = Q.Inactive.Border.Fg, bg = Q.Inactive.Border.Bg, gui = Q.Inactive.Border.Gui },
		ModeMsg							{ fg = Palette.Hint, bg = Q.Inactive.Border.Bg,	gui = Q.Standout.Gui },

		EndOfBuffer						{ fg = Q.Unimportant.Fg, bg = Q.Unimportant.Bg, gui = Q.Unimportant.Gui },
		NonText							{ fg = Q.Unimportant.Fg, bg = Q.NormalBg },
		Whitespace						{ fg = Q.Unimportant.Fg, bg = Q.NormalBg },



		-- Generic highlight groups

		Comment							{ fg = Q.Comment.Fg, bg = Q.Comment.Bg, gui = Q.Comment.Gui },
		Constant						{ fg = Q.Constant.Fg, bg = Q.Constant.Bg, gui = Q.Constant.Gui },
		Number							{ fg = Q.Number.Fg, bg = Q.Number.Bg, gui = Q.Number.Gui },
		Float							{ fg = Q.Number.Fg, bg = Q.Number.Bg, gui = Q.Number.Gui },
		String							{ fg = Q.String.Fg, bg = Q.String.Bg, gui = Q.String.Gui },
		Character						{ fg = Q.String.Fg, bg = Q.String.Bg, gui = Q.String.Gui },
		Boolean							{ fg = Q.Boolean.Fg, bg = Q.Boolean.Bg, gui = Q.Boolean.Gui },
		Identifier						{ fg = Q.Identifier.Fg, bg = Q.Identifier.Bg, gui = Q.Identifier.Gui },
		Variable						{ fg = Q.Identifier.Fg, bg = Q.Identifier.Bg, gui = Q.Identifier.Gui },
		Tag								{ fg = Q.Identifier.Fg, bg = Q.Identifier.Bg, gui = Q.Identifier.Gui },
		Function						{ fg = Q.Function.Fg, bg = Q.Function.Bg, gui = Q.Function.Gui },
		FunctionPrototype				{ fg = Q.Function.Fg, bg = Q.Function.Bg, gui = Q.Function.Gui },
		Statement						{ fg = Q.Statement.Fg, bg = Q.Statement.Bg, gui = Q.Statement.Gui },
		Conditional						{ fg = Q.Conditional.Fg, bg = Q.Conditional.Bg, gui = Q.Conditional.Gui },
		Repeat							{ fg = Q.Loop.Fg, bg = Q.Loop.Bg, gui = Q.Loop.Gui },
		Label							{ fg = Q.Loop.Fg, bg = Q.Loop.Bg, gui = Q.Loop.Gui },
		Operator						{ fg = Q.Operator.Fg, bg = Q.Operator.Bg, gui = Q.Operator.Gui },
		Special							{ fg = Q.Standout.Fg, bg = Q.Standout.Bg, gui = Q.Standout.Gui },
		Keyword							{ fg = Q.Statement.Fg, bg = Q.Statement.Bg, gui = Q.Statement.Gui },
		Exception						{ fg = Q.Statement.Fg, bg = Q.Statement.Bg, gui = Q.Statement.Gui },
		Macro							{ fg = Q.Macro.Fg, bg = Q.Macro.Bg, gui = Q.Macro.Gui },
		PreProc							{ fg = Q.CPP.Fg, bg = Q.CPP.Bg, gui = Q.CPP.Gui },
		Include							{ fg = Q.CPP.Fg, bg = Q.CPP.Bg, gui = Q.CPP.Gui },
		Define							{ fg = Q.CPP.Fg, bg = Q.CPP.Bg, gui = Q.CPP.Gui },
		PreConduit						{ fg = Q.CPP.Fg, bg = Q.CPP.Bg, gui = Q.CPP.Gui },
		Type							{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		TypeDef							{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		StorageClass					{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		Structure						{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		ClassName						{ fg = Q.Class.Fg, bg = Q.Class.Bg, gui = Q.Class.Gui },
		StructName						{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		UnionName						{ fg = Q.Type.Fg, bg = Q.Type.Bg, gui = Q.Type.Gui },
		Enumerator						{ fg = Q.Enum.Fg, bg = Q.Enum.Bg, gui = Q.Enum.Gui },
		EnumerationName					{ fg = Q.Constant.Fg, bg = Q.Constant.Bg, gui = Q.Constant.Gui },
		FileName						{ fg = Q.Constant.Fg, bg = Q.Constant.Bg, gui = Q.Constant.Gui },


		ErrorMsg						{ fg = Palette.Error },

		DiffAdd							{ fg = Palette.DiffAddFg,		bg = Palette.DiffAddBg,		gui = NoFmt },
		DiffDelete						{ fg = Palette.DiffDeleteFg,	bg = Palette.DiffDeleteBg,	gui = NoFmt },
		DiffChange						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = NoFmt },
		DiffText						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = FontMods.BU },
		sym('@text.diff.delete.diff')	{ DiffDelete },
		sym('@text.diff.add.diff')		{ DiffAdd },
		sym('@text.diff.change.diff')	{ DiffChange },
		sym('@text.diff.text.diff')		{ DiffText },

		NeogitDiffChange				{ DiffChange },
		NeogitDiffChangeModified		{ DiffChange },
		NeogitDiffChangeRegion			{ DiffChange },

		GitSignsAdd						{ fg = Palette.DiffAddFg,		bg = Q.Active.Border.Bg,		gui = NoFmt },
		GitSignsAddNr					{ fg = GitSignsAdd.fg,			bg = Q.Active.Border.Bg,		gui = GitSignsAdd.gui },
		GitSignsDelete					{ fg = Palette.DiffDeleteFg,	bg = Q.Active.Border.Bg,		gui = NoFmt },
		GitSignsDeleteNr				{ fg = GitSignsDelete.fg,		bg = Q.Active.Border.Bg,		gui = GitSignsDelete.gui },
		GitSignsChange					{ fg = Palette.DiffChangeFg,	bg = Q.Active.Border.Bg,		gui = NoFmt },
		GitSignsChangeNr				{ fg = GitSignsChange.fg,		bg = Q.Active.Border.Bg,		gui = GitSignsChange.gui },
		GitSignsChangeddelete			{ fg = GitSignsDelete.fg,		bg = Q.Active.Border.Bg,		gui = FontMods.B },
		GitSignsChangeddeleteNr			{ fg = GitSignsDelete.fg,		bg = Q.Active.Border.Bg,		gui = FontMods.B },
		GitSignsCurrentLineBlame		{ fg = Palette.DarkFg,			bg = Q.Active.Text.Bg,		gui = FontMods.I },


		Directory						{ fg = Colors.jade,				bg = NoFmt,					gui = FontMods.B },

		-- marks
		MarkSignHL						{ fg = Palette.Hint,	bg = Q.Active.Border.Bg,		gui = FontMods.B },
		MarkSignNumHL					{ fg = Palette.Hint,	bg = Q.Active.Border.Bg,		gui = FontMods.B },
		MarkVirtTextHL					{ fg = Q.Standout.Fg,	bg = NoFmt,							gui = NoFmt },

		-- Rainbow csv. Zero is apparently an even number :shrug:
		column0							{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column1							{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column2							{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column3							{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column4							{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column5							{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column6							{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column7							{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column8							{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column9							{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column10						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column11						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column12						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column13						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column14						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column15						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column16						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column17						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column18						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column19						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column20						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },
		column21						{ fg = Q.XMLOdd.Fg,		bg = Q.XMLOdd.Bg,	gui = Q.XMLOdd.Gui },
		column22						{ fg = Q.XMLEven.Fg,	bg = Q.XMLEven.Bg,	gui = Q.XMLEven.Gui },

		-- Neorg
		--sym('@neorg.markup.bold')		{ fg = Q.Normal.Fg,		bg = NoFmt,			gui = FontMods.B },
		--sym('@neorg.markup.italic')		{ fg = Q.Normal.Fg,		bg = NoFmt,			gui = FontMods.I },

		-----------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------

		LspReferenceText				{							bg = Colors.chambray.darken(50),	gui = FontMods.BI },
		LspReferenceRead				{							bg = Colors.leaf.darken(50),		gui = FontMods.BI },
		LspReferenceWrite				{							bg = Colors.pumpkin.darken(50),		gui = FontMods.BI },

		IlluminatedWordText				{							bg = Colors.chambray.darken(50),	gui = FontMods.BI },
		IlluminatedWordRead				{							bg = Colors.leaf.darken(50),		gui = FontMods.BI },
		IlluminatedWordWrite			{							bg = Colors.pumpkin.darken(50),		gui = FontMods.BI },

		LspCodeLens						{ fg = Colors.jade,			bg = NoFmt,					gui = NoFmt },
		LspCodeLensSeparator			{ fg = Colors.sky_blue,		bg = NoFmt,					gui = NoFmt },

		TroubleCount					{ fg = Colors.leaf,													gui = NoFmt },
		TroubleLocation					{ fg = Colors.dust,													gui = NoFmt },
		TroublePreview					{ fg = Colors.light_blue,											gui = NoFmt },
		TroubleIndent					{ fg = Colors.heavy_cloud,											gui = NoFmt },
		TroubleSource					{ fg = Colors.graphite.lighten(10),									gui = NoFmt },
		TroubleFoldIcon					{ fg = Colors.white,												gui = NoFmt },
		TroubleCode						{ fg = Colors.graphite.lighten(10),									gui = NoFmt },
		TroubleInformation				{ fg = Colors.gunmetal,												gui = NoFmt },
		TroubleFile						{ fg = Colors.jade,													gui = NoFmt },
		TroubleText						{ fg = Colors.slate,												gui = NoFmt },
		TroubleSignOther				{ fg = Colors.heavy_cloud,	bg = Q.Active.Border.Bg,				gui = NoFmt },
		TroubleNormal					{ fg = Colors.slate,												gui = NoFmt },
		TroubleHint						{ fg = Palette.Hint,												gui = NoFmt },
		TroubleTextHint					{ fg = Palette.Hint,												gui = NoFmt },
		TroubleSignHint					{ fg = Palette.Hint,		bg = Q.Active.Border.Bg,				gui = NoFmt },
		TroubleSignWarning				{ fg = Colors.pumpkin,		bg = Q.Active.Border.Bg,				gui = NoFmt },
		TroubleWarning					{ fg = Colors.pumpkin,												gui = NoFmt },
		TroubleTextWarning				{ fg = Colors.pumpkin,												gui = NoFmt },
		TroubleError					{ fg = Colors.crimson,												gui = NoFmt },
		TroubleSignError				{ fg = Colors.crimson,		bg = Q.Active.Border.Bg,				gui = NoFmt },
		TroubleTextError				{ fg = Colors.slate,												gui = NoFmt },
		TroubleSignInformation			{ fg = Colors.heavy_cloud,	bg = Q.Active.Border.Bg,				gui = NoFmt },
		TroubleTextInformation			{ fg = Colors.slate,												gui = NoFmt },

		InlayHint						{ fg = Colors.charcoal.lighten(20), gui = FontMods.I },

		DiagnosticUnnecessary			{ fg = Colors.gunmetal,		bg = Q.Active.Bg,					gui = "underdotted" },
		DiagnosticDeprecated			{ fg = Colors.gunmetal,		bg = Q.Active.Bg,					gui = "strikethrough" },
		DiagnosticOk					{ fg = Colors.venom,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticHint					{ fg = Palette.Hint,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticInfo					{ fg = Colors.gunmetal,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticWarn					{ fg = Colors.pumpkin,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticError					{ fg = Colors.crimson,		bg = Q.Active.Border.Bg,			gui = NoFmt },
		DiagnosticFloatingOk			{ fg = Colors.venom,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticFloatingHint			{ fg = Palette.Hint,			bg = Q.Active.Bg,				gui = NoFmt },
		DiagnosticFloatingInfo			{ fg = Colors.gunmetal,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticFloatingWarn			{ fg = Colors.pumpkin,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticFloatingError			{ fg = Colors.crimson,		bg = Q.Active.Bg,					gui = NoFmt },
		DiagnosticSignOk				{ fg = Colors.venom,		bg = Q.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignHint				{ fg = Palette.Hint,			bg = Q.Active.Border.Bg,		gui = NoFmt },
		DiagnosticSignInfo				{ fg = Colors.gunmetal,		bg = Q.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignWarn				{ fg = Colors.pumpkin,		bg = Q.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignError				{ fg = Colors.crimson,		bg = Q.Active.Border.Bg,			gui = NoFmt },
		DiagnosticUnderlineOk			{							bg = Colors.leaf.darken(80),		gui = NoFmt },
		DiagnosticUnderlineHint			{																gui = "underdotted" },
		DiagnosticUnderlineInfo			{							bg = Colors.gunmetal.darken(80),	gui = NoFmt },
		DiagnosticUnderlineWarn			{							bg = Colors.pumpkin.darken(80),		gui = "underdotted" },
		DiagnosticUnderlineError		{							bg = Colors.crimson.darken(80),		gui = "undercurl" },
		DiagnosticVirtualTextOk			{ fg = Colors.venom,											gui = NoFmt },
		DiagnosticVirtualTextHint		{ fg = Palette.Hint,											gui = NoFmt },
		DiagnosticVirtualTextInfo		{ fg = Colors.gunmetal,											gui = NoFmt },
		DiagnosticVirtualTextWarn		{ fg = Colors.pumpkin,											gui = NoFmt },
		DiagnosticVirtualTextError		{ fg = Colors.crimson,											gui = NoFmt },

		sym('@identifier')			{ Identifier },
		sym('@number')				{ Number },
		sym('@variable')			{ Variable },
		sym('@string')				{ String },
		sym('@conditional')			{ Conditional },
		sym('@path')				{ fg = Colors.moss,	gui = FontMods.I },
		sym('@comment')				{ Comment },
		sym('@bool')				{ Boolean },
		sym('@constant')			{ Constant },
		sym('@operator')			{ Operator },
		sym('@punctuation')			{ Operator },
		sym('@define')				{ Statement },
		sym('@define.category')		{ ClassName },
		sym('@define.name')			{ Macro },
		sym('@link')				{ Enumerator },
		sym('@link.data')			{ EnumerationName },



		sym('@attribute')				{ fg = Colors.dust.darken(20),									gui = NoFmt },
		sym('@lsp.mod.readonly') 		{ gui = FontMods.I },
		sym('@lsp.type.class')			{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.decorator')		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.enum')			{ fg = Enumerator.fg,		bg = Enumerator.bg,			gui = Enumerator.gui },
		sym('@lsp.type.enumMember')		{ fg = EnumerationName.fg,	bg = EnumerationName.bg,	gui = Enumeration.gui },
		sym('@lsp.type.function')		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@constructor.cpp')			{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.interface')		{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.macro')    		{ fg = Macro.fg,			bg = Macro.bg,				gui = Macro.gui },
		sym('@lsp.type.method')   		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.namespace')		{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.parameter')		{ fg = Variable.fg,			bg = Variable.bg,			gui = FontMods.I },
		sym('@lsp.type.property') 		{ fg = Variable.beige,		bg = Variable.bg,			gui = Variable.gui },
		sym('@lsp.type.struct')			{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.type')     		{ fg = Type.fg,				bg = Type.bg,				gui = Type.gui },
		sym('@lsp.type.typeParameter')	{ fg = TypeDef.fg,			bg = TypeDef.bg,			gui = TypeDef.gui },
		sym('@lsp.type.variable') 		{ fg = Variable.fg,			bg = Variable.bg,			gui = Variable.gui },
		sym('@lsp.mod.usedAsMutableReference.cpp')			{ fg = Colors.crimson.lighten(60), 		gui = FontMods.I },

		sym('@punctuation.bracket') 	{ fg = Q.Operator.Fg,		bg = Q.Operator.Bg,			gui = Q.Operator.Gui },
		sym('@punctuation.delimiter') 	{ fg = Q.Operator.Fg,		bg = Q.Operator.Bg,			gui = Q.Operator.Gui },
		sym('@string.escape')			{ fg = Q.String.Fg,			bg = Q.String.Bg,			gui = Q.String.Gui },
		sym('@type.qualifier')			{ fg = Keyword.fg,			bg = Keyword.bg,			gui = Keyword.gui },

		-----------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------

		DapBreakpoint					{ fg = Colors.crimson,			bg = Q.Active.Border.Bg,					gui = FontMods.B },
		DapBreakpointCondition			{ fg = Colors.crimson,			bg = Q.Active.Border.Bg,					gui = FontMods.B },
		DapBreakpointRejected			{ fg = Colors.crimson,			bg = Q.Active.Border.Bg,					gui = FontMods.B },
		DapLogPoint						{ fg = Colors.venom,			bg = NoFmt,					gui = FontMods.B },
		DapStopped						{ fg = Colors.crimson,			bg = NoFmt,					gui = FontMods.B },
		DapStoppedLine					{ fg = Colors.blue_clay,		bg = NoFmt},

		-- DAP UI
		DapUIEndofBuffer				{ fg = EndOfBuffer.fg,			bg = EndOfBuffer.bg },
		DapUINormal						{ fg = Q.Active.Text.Fg,		bg = Q.Active.Text.Bg },
		DapUIFloatNormal				{ fg = Q.Inactive.Text.Fg,		bg = Q.Inactive.Text.Bg },
		DapUIUnavailable				{ fg = Q.Inactive.Text.Fg,		bg = Q.Inactive.Text.Bg },
		DapUIBreakpointsCurrentLine		{ bg = Colors.crimson.darken(50),			gui = FontMods.U },
		DapUIBreakpointsLine			{ bg = Colors.crimson.darken(50) },
		DapUIBreakpointsDisabledLine	{ fg = Colors.black,			bg = Colors.burgundy,		gui = FontMods.BI },
		DapUIBreakpointsInfo			{ fg = Palette.Hint,			bg = NoFmt},
		DapUIDecoration					{ fg = Colors.cloud,			bg = NoFmt},
		DapUICurrentFrameName			{ fg = Colors.ripe_lemon,		bg = NoFmt},
		DapUIFrameName					{ fg = Q.String.Fg,				bg = Q.String.Bg,			gui = Q.String.Gui },
		DapUISource						{ fg = Q.Comment.Fg,			bg = Q.Comment.Bg,			gui = Q.Comment.Gui },
		DapUILineNumber					{ fg = Q.Comment.Fg,			bg = Q.Comment.Bg,			gui = Q.Comment.Gui },
		DapUIBreakpointsPath			{},
		DapUIThread						{ fg = Colors.moss,				bg = NoFmt},
		DapUIStoppedThread				{ fg = Colors.kiwi,				bg = NoFmt,					gui = FontMods.BU },
		DapUIType						{ fg = Type.fg,					bg = Type.bg,				gui = Type.gui },
		DapUIVariable					{ fg = Colors.beige,			bg = Type.bg,				gui = Type.gui },
		DapUIValue						{ fg = Constant.fg,				bg = Type.bg,				gui = Type.gui },
		DapUIModifiedValue				{ fg = Colors.papaya,			bg = NoFmt},
		DapUIScope						{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIPlayPause					{ fg = Colors.venom,			bg = NoFmt},
		DapUIPlayPauseNC				{ fg = Colors.venom,			bg = NoFmt},
		DapUIRestart					{ fg = Colors.rosso_corsa,		bg = NoFmt},
		DapUIRestartNC					{ fg = Colors.rosso_corsa,		bg = NoFmt},
		DapUIStop						{ fg = Colors.rosso_corsa,		bg = NoFmt},
		DapUIStopNC						{ fg = Colors.rosso_corsa,		bg = NoFmt},
		DapUIStepBack					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepBackNC					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOver					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOverNC					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOut					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOutNC					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepInto					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepIntoNc					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIWatchesEmpty				{ fg = Colors.dust,				bg = NoFmt,					gui = NoFmt },
		DapUIWatchesError				{ fg = Palette.Error,			bg = NoFmt,					gui = NoFmt},
		DapUIWatchesValue				{ fg = Colors.venom,			bg = NoFmt,					gui = FontMods.B },
		-- idk what these are:
		DapUIFloatBorder				{ fg = Colors.lead,				bg = Colors.venom,		gui = FloatBorder.gui },
		DapUIWinSelect					{ fg = Colors.lead,				bg = Colors.venom,		gui = FloatBorder.gui },

		LeapMatch						{ fg = Colors.black,					bg = Colors.matte_sapphire.darken(10),		gui = FontMods.B },
		LeapLabelPrimary				{ fg = Colors.black,					bg = Colors.sky_blue.darken(10),			gui = FontMods.B },
		LeapLabelSecondary				{ fg = Colors.heavy_cloud.lighten(30),	bg = Colors.chambray.darken(10),			gui = FontMods.B},

		NotifyBackground				{ fg = NoFmt,					bg = Colors.black,			gui = NoFmt },

		HighlightUndo					{ fg = Colors.black,					bg = Colors.matte_sapphire,	gui = NoFmt },
		HighlightRedo					{ fg = Colors.black,					bg = Colors.faded_green,	gui = NoFmt },

		TokenKey						{ fg = Macro.fg,						bg = Macro.bg,				gui = NoFmt },
		TokenId							{ fg = Constant.fg,						bg = Constants.bg,			gui = NoFmt },
	}
end)


return qnrd_theme
