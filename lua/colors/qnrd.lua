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
	pinkface				= hsl("#FF00FF"),
	lavender 				= hsl("#d8a0df"),
	matte_sapphire			= hsl("#5f87d7"),
	morning_sky				= hsl("#2d93dd"),
	light_blue 				= hsl("#569cd6"),
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
	light_mocha 			= hsl("#d69d85"),
	mocha					= hsl("#ab654b"),
	mahogany 				= hsl("#954a4a"),
	crimson					= hsl("#dc143c"),
	rosso_corsa				= hsl("#D70000"),
	pumpkin					= hsl("#d75f00"),
	papaya					= hsl("#d78700"),
	clownfish 				= hsl("#ff8000"),
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
	DarkBg = Colors.charcoal.darken(20),
	Bg = Colors.charcoal,
	LightBg = Colors.charcoal.lighten(2),
	HighlightBg = Colors.mint,

	DarkFg = Colors.heavy_cloud,
	Fg = Colors.white,
	LightFg = Colors.whiter,
	HighlightFg = Colors.lead,

	Standout = Colors.turqoise,

	CursorFg = Colors.slate,
	CursorBg = Colors.cactus,

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
	Unimportant = { Fg = Colors.lead, Bg = Colors.charcoal, Gui = '' },
	Highlight = { Fg = Colors.lead, Bg = Colors.mint, Gui = FontMods.B },
	Selected = { Fg = Colors.cloud, Bg = Colors.lead, Gui = NoFmt },

	XMLEven = { Fg = Colors.jade, Bg = Colors.charcoal, Gui = NoFmt },
	XMLOdd = { Fg = Colors.white, Bg = Colors.graphite, Gui = NoFmt },
}

local qnrd_theme = lush( function(injected_functions)
	local sym = injected_functions.sym
	return {
		Normal							{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		NormalFloat						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		FloatBorder						{ fg = Q.Window.Active.Border.Fg,  bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		FloatTitle						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = FontMods.B },
		NormalNC						{ fg = Q.Normal.Fg,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },

		Pmenu							{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuSel						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuKind						{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuExtra						{ fg = Q.Menu.Inactive.Fg,	bg = Q.Menu.Inactive.Bg,	gui = Q.Menu.Inactive.Gui },
		PmenuExtraSel					{ fg = Q.Menu.Active.Fg,	bg = Q.Menu.Active.Bg,		gui = Q.Menu.Active.Gui },
		PmenuSbar						{ fg = Q.Window.Active.Scroll.Fg,	bg = Q.Window.Active.Scroll.Bg,	gui = Q.Window.Active.Scroll.Gui },
		PmenuThumb						{ fg = Q.Window.Active.Scroll.Bg,	bg = Q.Window.Active.Scroll.Fg,	gui = Q.Window.Active.Scroll.Gui },

		Question						{ fg = Q.Highlight.Fg,		bg = Q.Highlight.Bg,		gui = Q.Highlight.Gui },
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
		TermCursorNC					{ fg = Q.Selected.Fg,		bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },

		CursorLine						{ fg = Q.Normal.Fg,			bg = Palette.LightBg,		gui = NoFmt },
		CursorColumn					{ fg = Q.Normal.Fg,			bg = Palette.LightBg,		gui = NoFmt },
		ColorColumn						{ fg = Q.Normal.Fg,			bg = Palette.LightBg,		gui = FontMods.B },

		SignColumn						{ fg = Q.Window.Active.Border.Fg,	bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		StatusLine						{ fg = Q.Window.Active.Border.Fg,	bg = Q.Window.Active.Border.Bg,	gui = Q.Window.Active.Border.Gui },
		StatusLineNC					{ fg = Q.Window.Inactive.Border.Fg,	bg = Q.Window.Inactive.Border.Bg,	gui = Q.Window.Inactive.Border.Gui },
		WinSeparator					{ fg = Q.Window.Inactive.Border.Fg,	bg = Q.Window.Inactive.Border.Bg,	gui = Q.Window.Inactive.Border.Gui },
		ModeMsg							{ fg = Q.Standout.Fg,				bg = Q.Window.Inactive.Border.Bg,	gui = Q.Standout.Gui },

		EndOfBuffer						{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },
		NonText							{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },
		Whitespace						{ fg = Q.Unimportant.Fg,	bg = Q.Unimportant.Bg,		gui = Q.Unimportant.Gui },



		-- Generic highlight groups

		Comment							{ fg = Palette.DarkFg,		bg = Q.Normal.Bg,			gui = Q.Normal.Gui },

		Constant						{ fg = Colors.sage,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		-- <++>Number							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>String							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Character						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Boolean							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Float							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		-- <++>Identifier						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Function						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Tag								{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		-- <++>Statement						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Conditional						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Repeat							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Label							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Operator						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Keyword							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Exception						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		-- <++>PreProc							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Include							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Define							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Macro							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>PreConduit						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		Type							{ fg = Colors.sky_blue,		bg = Q.Normal.Bg,		gui = Q.Normal.Gui },
		-- <++>StorageClass					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Structure						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		--
		-- <++>ClassName						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>StructName						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>UnionName						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Enumerator						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>EnumerationName					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>FunctionPrototype				{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>TypeDef							{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>Variable						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>FileName						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		-- <++>ErrorMsg						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },

		DiffAdd							{ fg = Palette.DiffAddFg,		bg = Palette.DiffAddBg,		gui = NoFmt },
		DiffDelete						{ fg = Palette.DiffDeleteFg,	bg = Palette.DiffDeleteBg,	gui = NoFmt },
		DiffChange						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = NoFmt },
		DiffText						{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = FontMods.Combine{ FontMods.B, FontMods.U } },

		GitSignsAdd						{ fg = Palette.DiffAddFg,		bg = Palette.DiffAddBg,		gui = NoFmt },
		GitSignsAddNr					{ fg = GitSignsAdd.fg,			bg = GitSignsAdd.bg,		gui = GitSignsAdd.gui },
		GitSignsDelete					{ fg = Palette.DiffDeleteFg,	bg = Palette.DiffDeleteBg,	gui = NoFmt },
		GitSignsDeleteNr				{ fg = GitSignsDelete.fg,		bg = GitSignsDelete.bg,		gui = GitSignsDelete.gui },
		GitSignsChange					{ fg = Palette.DiffChangeFg,	bg = Palette.DiffChangeBg,	gui = NoFmt },
		GitSignsChangeNr				{ fg = GitSignsChange.fg,		bg = GitSignsChange.bg,		gui = GitSignsChange.gui },
		GitSignsChangeddelete			{ fg = GitSignsDelete.fg,		bg = GitSignsDelete.bg,		gui = FontMods.B },
		GitSignsChangeddeleteNr			{ fg = GitSignsDelete.fg,		bg = GitSignsDelete.bg,		gui = FontMods.B },
		GitSignsCurrentLineBlame		{ fg = Palette.DarkFg,			bg = Q.Normal.Bg,			gui = FontMods.I },


		Directory						{ fg = Colors.jade,				bg = Q.Normal.Bg,			gui = FontMods.B },

		-- <++>-- TODO: populate with n
		-- <++>sym('@type')						{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@type.builtin')				{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@type.qualifier')			{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@punctuation')				{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym"@punctuation.bracket		{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@preproc')					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@namespace')					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@variable')					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym('@text.literal')				{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>sym"@conditional.ternary		{ fg = <++>,<++>bg = <++>,<++>gui = <++> },


		-- marks
		MarkSignHL						{ fg = Palette.Hint,	bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
		MarkSignNumHL					{ fg = Palette.Hint,	bg = Q.Window.Active.Border.Bg,		gui = FontMods.B },
		MarkVirtTextHL					{ fg = Q.Standout.Fg,	bg = Q.Normal.Bg,					gui = NoFmt },

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
		sym('@neorg.markup.bold')			{ fg = Q.Normal.Fg,		bg = Q.Normal.Bg,		gui = FontMods.B },
		sym('@neorg.markup.italic')			{ fg = Q.Normal.Fg,		bg = Q.Normal.Bg,		gui = FontMods.I },

		-- lsp
		-- <++>sym('@lsp.type.class.cpp')		{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
--

		-- DAP UI
		DapStoppedLine					{ fg = Colors.blue_clay,		bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIBreakpointsCurrentLine		{ fg = Colors.crimson,			bg = Q.Normal.Bg,			gui = FontMods.Combine{FontMods.B, FontMods.U} },
		DapUIBreakpointsInfo			{ fg = Palette.Hint,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIBreakpointsPath			{ fg = Colors.mocha,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIDecoration					{ fg = Colors.cloud,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIFrameName					{ fg = Colors.dust,				bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUISource						{ fg = Colors.mocha,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUILineNumber					{ fg = Colors.matte_sapphire,	bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIThread						{ fg = Colors.moss,				bg = Q.Normal.Bg,		gui = Q.Normal.Gui },
		DapUIStoppedThread				{ fg = Colors.kiwi,				bg = Q.Normal.Bg,			gui = FontMods.Combine{FontMods.B, FontMods.U} },
		DapUIType						{ fg = Type.fg,					bg = Type.bg,				gui = Type.gui },
		DapUIVariable					{ fg = Colors.beige,			bg = Type.bg,				gui = Type.gui },
		DapUIValue						{ fg = Constant.fg,				bg = Type.bg,				gui = Type.gui },
		DapUIModifiedValue				{ fg = Colors.papaya,			bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIPlayPause					{ fg = Colors.venom,			bg = Q.Normal.Bf,			gui = Q.Normal.Gui },
		DapUIRestart					{ fg = Colors.rosso_corsa,		bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIStop						{ fg = Colors.rosso_corsa,		bg = Q.Normal.Bg,			gui = Q.Normal.Gui },
		DapUIScope						{ fg = Colors.morning_sky,		bg = Q.Normal.Bg,			gui = FontMods.B },
		DapUIStepBack					{ fg = Colors.morning_sky,		bg = Q.Normal.Bg,		gui = FontMods.B },
		DapUIStepOver					{ fg = Colors.morning_sky,		bg = Q.Normal.Bg,		gui = FontMods.B },
		DapUIStepOut					{ fg = Colors.morning_sky,		bg = Q.Normal.Bg,		gui = FontMods.B },
		DapUIStepInto					{ fg = Colors.morning_sky,		bg = Q.Normal.Bg,		gui = FontMods.B },
		DapUIWatchesEmpty				{ fg = Q.Unimportant.Fg,		bg = Q.Unimportant.Bg,	gui = Q.Unimportant.Gui },
		DapUIWatchesError				{ fg = Palette.Error,			bg = Q.Normal.Bg,		gui = NoFmt},
		-- idk what these are:
		DapUIFloatBorder				{ fg = Colors.lead,				bg = Colors.pinkface,		gui = FloatBorder.gui },
		DapUIWatchesValue				{ fg = Colors.lead,				bg = Colors.pinkface,		gui = FloatBorder.gui },
		DapUIWinSelect					{ fg = Colors.lead,				bg = Colors.pinkface,		gui = FloatBorder.gui },
		-- <++>DapUIFloatBorder					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>DapUIWatchesValue				{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
		-- <++>DapUIWinSelect					{ fg = <++>,<++>bg = <++>,<++>gui = <++> },
	}
end)


return qnrd_theme
