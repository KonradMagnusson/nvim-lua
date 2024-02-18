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
	I = 'italic',
	U = 'underline',
	Combine = function(mods) return table.concat(mods, ',') end
}

local Palette = {
	Bg = Colors.charcoal,

	DarkFg = Colors.heavy_cloud,
	Fg = Colors.white,

	Standout = Colors.turqoise,

	Hint = Colors.faded_green,
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
}

local Q = {
	Window = {
		Active = {
			Border = { Fg = Colors.slate, Bg = Colors.lead.darken(75), Gui = NoFmt },
			Scroll = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
		},
		Inactive = {
			Border = { Fg = Colors.graphite, Bg = Colors.lead.darken(75), Gui = NoFmt },
			Scroll = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
		}
	},
	Menu = {
		Inactive = { Fg = Colors.slate, Bg = Colors.graphite, Gui = NoFmt },
		Active = { Fg = Colors.white, Bg = Colors.lead, Gui = FontMods.B },
	},
	Normal = { Fg = Colors.white, Bg = Colors.charcoal, Gui = '' },
	Standout = { Fg = Colors.turqoise, Bg = Colors.graphite, Gui = FontMods.B },
	Unimportant = { Fg = Colors.heavy_cloud, Bg = Colors.charcoal, Gui = '' },
	Highlight = { Fg = Colors.cote_dazur, Bg = Colors.gunmetal.darken(35), Gui = FontMods.Combine{ FontMods.B, FontMods.I } },
	Selected = { Fg = Colors.cloud, Bg = Colors.lead, Gui = NoFmt },

	XMLEven = { Fg = Colors.jade, Bg = Colors.charcoal, Gui = NoFmt },
	XMLOdd = { Fg = Colors.white, Bg = Colors.graphite, Gui = NoFmt },
}

local qnrd_theme = lush( function(injected_functions)
	local sym = injected_functions.sym
	return {
		Normal							{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		NormalFloat						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		FloatBorder						{ fg = Q.Window.Active.Border.Fg,  bg = Q.Window.Active.Bg,	gui = Q.Window.Active.Border.Gui },
		Title							{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = FontMods.B },
		FloatTitle						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = FontMods.B },
		NormalNC						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },

		Pmenu							{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuSel						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuKind						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuExtra						{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuExtraSel					{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuSbar						{ fg = Q.Window.Active.Scroll.Fg,	bg = Q.Window.Active.Scroll.Bg,	gui = Q.Window.Active.Scroll.Gui },
		PmenuThumb						{ fg = Q.Window.Active.Scroll.Bg,	bg = Q.Window.Active.Scroll.Fg,	gui = Q.Window.Active.Scroll.Gui },

		Question						{ fg = Colors.mint,			bg = NoFmt,					gui = NoFmt },
		QuickFixLine					{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,		gui = Q.Highlight.Gui },

		Search							{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,			gui = Q.Highlight.Gui },
		IncSearch						{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,			gui = Q.Highlight.Gui },

		Visual							{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },
		VisualNOS						{ fg = Q.Selected.Bg,		bg = Q.Selected.Fg,			gui = Q.Selected.Gui },

		Folded							{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },
		FoldedColumn					{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },

		LineNr							{ fg = Colors.gunmetal,		bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		CursorLineNr					{ fg = Q.Menu.Active.Fg,	bg = Q.Window.Active.Border.Bg,	gui = Q.Menu.Active.Gui },
		LineNrBelow						{ fg = Colors.mahogany,		bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		LineNrAbove						{ fg = Colors.cactus,		bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },

		Cursor							{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },
		TermCursor						{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },
		TermCursorNC					{ fg = Q.Selected.Fg,		bg = Q.Selected.Bg,			gui = Q.Selected.Gui },

		CursorLine						{ fg = NoFmt,				bg = Q.Normal.Bg.lighten(5),		gui = NoFmt },

		CursorColumn					{ fg = NoFmt,				bg = Q.Normal.Bg.lighten(5),		gui = NoFmt },
		ColorColumn						{ fg = NoFmt,				bg = Q.Normal.Bg.lighten(5),		gui = FontMods.B },

		SignColumn						{ fg = Q.Window.Active.Border.Fg,	bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		StatusLine						{ fg = Q.Window.Active.Border.Fg,	bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		StatusLineNC					{ fg = Q.Window.Inactive.Border.Fg,	bg = Q.Window.Inactive.Border.Bg,	gui = Q.Window.Inactive.Border.Gui },
		WinSeparator					{ fg = Q.Window.Inactive.Border.Fg,	bg = Q.Window.Inactive.Border.Bg,	gui = Q.Window.Inactive.Border.Gui },
		ModeMsg							{ fg = Q.Standout.Fg,				bg = Q.Window.Inactive.Border.Bg,	gui = Q.Standout.Gui },

		EndOfBuffer						{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },
		NonText							{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },
		Whitespace						{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },



		-- Generic highlight groups

		Comment							{ fg = Palette.DarkFg,		bg = NoFmt,					gui = Q.Normal.Gui },

		Constant						{ fg = Colors.sage,			bg = NoFmt,					gui = Q.Normal.Gui },
		Number							{ fg = Colors.jade,			bg = NoFmt,					gui = Q.Normal.Gui },
		String							{ fg = Colors.piggy,	bg = NoFmt,					gui = Q.Normal.Gui },
		Character						{ fg = Colors.piggy,	bg = NoFmt,					gui = Q.Normal.Gui },
		Boolean							{ fg = Colors.light_blue,	bg = NoFmt,					gui = Q.Normal.Gui },
		Float							{ fg = Colors.mint,			bg = NoFmt,					gui = Q.Normal.Gui },

		Identifier						{ fg = Colors.light_olive,	bg = NoFmt,					gui = Q.Normal.Gui },
		Function						{ fg = Colors.leaf,			bg = NoFmt,					gui = FontMods.B },
		Tag								{ fg = Colors.beige,		bg = NoFmt,					gui = FontMods.B },

		Statement						{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Conditional						{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Repeat							{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Label							{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Operator						{ fg = Colors.sage,			bg = NoFmt,					gui = Q.Normal.Gui },
		Keyword							{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Exception						{ fg = Colors.lilac,		bg = NoFmt,					gui = Q.Normal.Gui },
		Special							{ fg = Colors.sage,			bg = NoFmt,					gui = Q.Normal.Gui },

		Macro							{ fg = Colors.school_bus,	bg = NoFmt,					gui = Q.Normal.Gui },
		PreProc							{ fg = Colors.gunmetal,		bg = NoFmt,					gui = Q.Normal.Gui },
		Include							{ fg = Colors.gunmetal,		bg = NoFmt,					gui = Q.Normal.Gui },
		Define							{ fg = Colors.gunmetal,		bg = NoFmt,					gui = Q.Normal.Gui },
		PreConduit						{ fg = Colors.gunmetal,		bg = NoFmt,					gui = Q.Normal.Gui },

		Type							{ fg = Colors.sky_blue,		bg = NoFmt,					gui = Q.Normal.Gui },
		StorageClass					{ fg = Colors.dust,			bg = NoFmt,					gui = Q.Normal.Gui },
		Structure						{ fg = Colors.jade,			bg = NoFmt,					gui = FontMods.B },

		ClassName						{ fg = Structure.fg,		bg = Structure.bg,			gui = Structure.gui },
		StructName						{ fg = Structure.fg,		bg = Structure.bg,			gui = Structure.gui },
		UnionName						{ fg = Structure.fg,		bg = Structure.bg,			gui = Structure.gui },
		Enumerator						{ fg = Colors.matte_sapphire,		bg = NoFmt,					gui = FontMods.B },
		EnumerationName					{ fg = Colors.morning_sky,	bg = NoFmt,					gui = FontMods.I },
		FunctionPrototype				{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		TypeDef							{ fg = Colors.sky_blue,		bg = NoFmt,					gui = FontMods.I },
		Variable						{ fg = Identifier.fg,		bg = Identifier.bg,			gui = Identifier.gui },
		FileName						{ fg = Colors.light_mocha,	bg = NoFmt,					gui = Q.Normal.Gui },

		ErrorMsg						{ fg = Colors.rosso_corsa,	bg = NoFmt,					gui = Q.Normal.Gui },

		DiffAdd							{ fg = Palette.DiffAddFg,		bg = Palette.DiffAddBg,		gui = NoFmt },
		DiffDelete						{ fg = Palette.DiffDeleteFg,	bg = Palette.DiffDeleteBg,	gui = NoFmt },
		DiffChange						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = NoFmt },
		DiffText						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = FontMods.Combine{ FontMods.B, FontMods.U } },
		sym('@text.diff.delete.diff')	{ DiffDelete },
		sym('@text.diff.add.diff')		{ DiffAdd },
		sym('@text.diff.change.diff')	{ DiffChange },
		sym('@text.diff.text.diff')		{ DiffText },

		GitSignsAdd						{ fg = Palette.DiffAddFg,		bg = Q.Window.Active.Border.Bg,		gui = NoFmt },
		GitSignsAddNr					{ fg = GitSignsAdd.fg,			bg = Q.Window.Active.Border.Bg,		gui = GitSignsAdd.gui },
		GitSignsDelete					{ fg = Palette.DiffDeleteFg,	bg = Q.Window.Active.Border.Bg,		gui = NoFmt },
		GitSignsDeleteNr				{ fg = GitSignsDelete.fg,		bg = Q.Window.Active.Border.Bg,		gui = GitSignsDelete.gui },
		GitSignsChange					{ fg = Palette.DiffChangeFg,	bg = Q.Window.Active.Border.Bg,		gui = NoFmt },
		GitSignsChangeNr				{ fg = GitSignsChange.fg,		bg = Q.Window.Active.Border.Bg,		gui = GitSignsChange.gui },
		GitSignsChangeddelete			{ fg = GitSignsDelete.fg,		bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
		GitSignsChangeddeleteNr			{ fg = GitSignsDelete.fg,		bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
		GitSignsCurrentLineBlame		{ fg = Palette.DarkFg,			bg = Q.Window.Active.Border.Bg,		gui = FontMods.I },


		Directory						{ fg = Colors.jade,				bg = NoFmt,					gui = FontMods.B },

		-- marks
		MarkSignHL						{ fg = Palette.Hint,	bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
		MarkSignNumHL					{ fg = Palette.Hint,	bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
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
		sym('@neorg.markup.bold')		{ fg = Q.Normal.Fg,		bg = NoFmt,			gui = FontMods.B },
		sym('@neorg.markup.italic')		{ fg = Q.Normal.Fg,		bg = NoFmt,			gui = FontMods.I },

		-----------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------

		LspReferenceText				{ fg = Colors.light_mocha,	bg = NoFmt,					gui = NoFmt },
		LspReferenceRead				{ fg = Colors.dust,			bg = NoFmt,					gui = NoFmt },
		LspReferenceWrite				{ fg = Colors.papaya,		bg = NoFmt,					gui = NoFmt },
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
		TroubleSignOther				{ fg = Colors.heavy_cloud,	bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		TroubleNormal					{ fg = Colors.slate,												gui = NoFmt },
		TroubleHint						{ fg = Colors.mint,													gui = NoFmt },
		TroubleTextHint					{ fg = Colors.slate,												gui = NoFmt },
		TroubleSignHint					{ fg = Colors.mint,			bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		TroubleSignWarning				{ fg = Colors.pumpkin,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		TroubleWarning					{ fg = Colors.pumpkin,												gui = NoFmt },
		TroubleTextWarning				{ fg = Colors.pumpkin,												gui = NoFmt },
		TroubleError					{ fg = Colors.crimson,												gui = NoFmt },
		TroubleSignError				{ fg = Colors.crimson,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		TroubleTextError				{ fg = Colors.slate,												gui = NoFmt },
		TroubleSignInformation			{ fg = Colors.heavy_cloud,	bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		TroubleTextInformation			{ fg = Colors.slate,												gui = NoFmt },


		DiagnosticUnnecessary			{ fg = Colors.gunmetal,		bg = Q.Normal.Bg,					gui = NoFmt },
		DiagnosticDeprecated			{ fg = Colors.gunmetal,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticOk					{ fg = Colors.venom,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticHint					{ fg = Colors.mint,			bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticInfo					{ fg = Colors.gunmetal,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticWarn					{ fg = Colors.pumpkin,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticError					{ fg = Colors.crimson,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticFloatingOk			{ fg = Colors.venom,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticFloatingHint			{ fg = Colors.mint,			bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticFloatingInfo			{ fg = Colors.gunmetal,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticFloatingWarn			{ fg = Colors.pumpkin,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticFloatingError			{ fg = Colors.crimson,		bg = Q.Window.Active.Bg,			gui = NoFmt },
		DiagnosticSignOk				{ fg = Colors.venom,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignHint				{ fg = Colors.mint,			bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignInfo				{ fg = Colors.gunmetal,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignWarn				{ fg = Colors.pumpkin,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticSignError				{ fg = Colors.crimson,		bg = Q.Window.Active.Border.Bg,			gui = NoFmt },
		DiagnosticUnderlineOk			{							bg = Colors.leaf.darken(80),		gui = NoFmt },
		DiagnosticUnderlineHint			{							bg = Colors.moss.darken(70),		gui = NoFmt },
		DiagnosticUnderlineInfo			{							bg = Colors.gunmetal.darken(80),	gui = NoFmt },
		DiagnosticUnderlineWarn			{							bg = Colors.pumpkin.darken(80),		gui = NoFmt },
		DiagnosticUnderlineError		{							bg = Colors.crimson.darken(80),		gui = NoFmt },
		DiagnosticVirtualTextOk			{ fg = Colors.venom,											gui = NoFmt },
		DiagnosticVirtualTextHint		{ fg = Colors.mint,												gui = NoFmt },
		DiagnosticVirtualTextInfo		{ fg = Colors.gunmetal,											gui = NoFmt },
		DiagnosticVirtualTextWarn		{ fg = Colors.pumpkin,											gui = NoFmt },
		DiagnosticVirtualTextError		{ fg = Colors.crimson,											gui = NoFmt },

		sym('@attribute')				{ fg = Colors.dust,			bg = NoFmt,					gui = NoFmt },
		sym('@lsp.type.class')			{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.decorator')		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.enum')			{ fg = Enumerator.fg,		bg = Enumerator.bg,			gui = Enumerator.gui },
		sym('@lsp.type.enumMember')		{ fg = EnumerationName.fg,	bg = EnumerationName.bg,	gui = Enumeration.gui },
		sym('@lsp.type.function')		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.interface')		{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.macro')    		{ fg = Macro.fg,			bg = Macro.bg,				gui = Macro.gui },
		sym('@lsp.type.method')   		{ fg = Function.fg,			bg = Function.bg,			gui = Function.gui },
		sym('@lsp.type.namespace')		{ fg = ClassName.fg,		bg = ClassName.bg,			gui = NoFmt },
		sym('@lsp.type.parameter')		{ fg = Variable.fg,			bg = Variable.bg,			gui = FontMods.I },
		sym('@lsp.type.property') 		{ fg = Colors.beige,		bg = Variable.bg,			gui = Variable.gui },
		sym('@lsp.type.struct')			{ fg = ClassName.fg,		bg = ClassName.bg,			gui = ClassName.gui },
		sym('@lsp.type.type')     		{ fg = Type.fg,				bg = Type.bg,				gui = Type.gui },
		sym('@lsp.type.typeParameter')	{ fg = TypeDef.fg,			bg = TypeDef.bg,			gui = TypeDef.gui },
		sym('@lsp.type.variable') 		{ fg = Variable.fg,			bg = Variable.bg,			gui = Variable.gui },
		sym('@type.qualifier')			{ fg = Type.fg.lighten(40),	bg = Type.bg,				gui = Type.gui },
		sym('@punctuation.bracket') 	{ fg = Colors.dust,			bg = NoFmt,					gui = NoFmt },
		sym('@punctuation.delimiter') 	{ fg = Colors.dust,			bg = NoFmt,					gui = NoFmt },
		sym('@string.escape')			{ fg = Colors.mocha,		bg = NoFmt,					gui = FontMods.B },

		sym('@lsp.mod.readonly') 		{ fg = NoFmt,				bg = NoFmt,					gui = NoFmt },

		-----------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------

		DapBreakpoint					{ fg = Colors.crimson,			bg = Q.Window.Active.Border.Bg,					gui = FontMods.B },
		DapBreakpointCondition			{ fg = Colors.crimson,			bg = Q.Window.Active.Border.Bg,					gui = FontMods.B },
		DapBreakpointRejected			{ fg = Colors.crimson,			bg = Q.Window.Active.Border.Bg,					gui = FontMods.B },
		DapLogPoint						{ fg = Colors.venom,			bg = NoFmt,					gui = FontMods.B },
		DapStopped						{ fg = Colors.crimson,			bg = NoFmt,					gui = FontMods.B },
		-- DAP UI
		DapStoppedLine					{ fg = Colors.blue_clay,		bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIBreakpointsCurrentLine		{ fg = Colors.crimson,			bg = NoFmt,					gui = FontMods.Combine{FontMods.B, FontMods.U} },
		DapUIBreakpointsInfo			{ fg = Palette.Hint,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIBreakpointsPath			{ fg = Colors.mocha,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIDecoration					{ fg = Colors.cloud,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIFrameName					{ fg = Colors.dust,				bg = NoFmt,					gui = Q.Normal.Gui },
		DapUISource						{ fg = Colors.mocha,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUILineNumber					{ fg = Colors.matte_sapphire,	bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIThread						{ fg = Colors.moss,				bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIStoppedThread				{ fg = Colors.kiwi,				bg = NoFmt,					gui = FontMods.Combine{FontMods.B, FontMods.U} },
		DapUIType						{ fg = Type.fg,					bg = Type.bg,				gui = Type.gui },
		DapUIVariable					{ fg = Colors.beige,			bg = Type.bg,				gui = Type.gui },
		DapUIValue						{ fg = Constant.fg,				bg = Type.bg,				gui = Type.gui },
		DapUIModifiedValue				{ fg = Colors.papaya,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIPlayPause					{ fg = Colors.venom,			bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIRestart					{ fg = Colors.rosso_corsa,		bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIStop						{ fg = Colors.rosso_corsa,		bg = NoFmt,					gui = Q.Normal.Gui },
		DapUIScope						{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepBack					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOver					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepOut					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIStepInto					{ fg = Colors.morning_sky,		bg = NoFmt,					gui = FontMods.B },
		DapUIWatchesEmpty				{ fg = Colors.dust,				bg = NoFmt,					gui = NoFmt },
		DapUIWatchesError				{ fg = Palette.Error,			bg = NoFmt,					gui = NoFmt},
		DapUIWatchesValue				{ fg = Colors.venom,			bg = NoFmt,					gui = FontMods.B },
		-- idk what these are:
		DapUIFloatBorder				{ fg = Colors.lead,				bg = Colors.venom,		gui = FloatBorder.gui },
		DapUIWinSelect					{ fg = Colors.lead,				bg = Colors.venom,		gui = FloatBorder.gui },
		-- <++>DapUIFloatBorder					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>DapUIWinSelect					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },


		NotifyBackground				{ fg = NoFmt,					bg=Colors.black,			gui = NoFmt },

		IlluminatedWordText				{ fg = NoFmt,					bg=NoFmt,					gui = FontMods.Combine{ FontMods.B, FontMods.I }},
	}
end)


return qnrd_theme
