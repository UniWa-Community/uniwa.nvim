--theme
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--
-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--


local lush         = require('lush')
local hsl          = lush.hsl
local hsluv        = lush.hsluv

local uniwa_blue   = hsluv(249, 89, 24) -- uniwa blue
local uniwa_lblue  = hsluv(246, 87, 69) -- uniwa light blue
local uniwa_grey   = hsluv(86, 22, 64)  -- uniwa tan grey
local peach_white  = hsluv("#fff4e5")

local foreground   = uniwa_lblue.lighten(50)
local background   = uniwa_blue.da(60).de(40)

if vim.g.uniwa_variant == "light" then
	foreground, background = background, peach_white
elseif vim.g.uniwa_variant == "dark" then
	background = background.da(80)
end

local middleground = background.mix(foreground, 30)

local grey   = uniwa_grey
local black  = background.mix(grey, 20)
local white  = foreground.mix(grey, 20)
local dark   = background.da(60)

local base_1 = uniwa_blue.li(20).de(0)
if vim.g.uniwa_variant == "light" then
	base_1 = base_1.da(40)
end

local blue      = base_1
local magenta   = base_1.ro(50)
local red       = base_1.ro(120)
local crimson   = base_1.ro(120).li(20)
local brown     = base_1.ro(160)
local tropic    = base_1.ro(240)
local turquoise = base_1.ro(300)

local base_2    = uniwa_lblue

if vim.g.uniwa_variant == "light" then
	base_2 = base_2.da(40)
end

local azure   = base_2
local lilac   = base_2.ro(50).de(10)
local salmon  = base_2.ro(120)
local orange  = base_2.ro(160)
local yellow  = base_2.ro(188).li(40).sa(10)
local cabbage = base_2.ro(225)
local green   = tropic.li(45).de(15)
local teal    = base_2.ro(300).de(40)
local cyan    = base_2.ro(300)

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- preview of :Lushify'ed colors
		the_background { fg = background, bg = black },
		the_foreground { fg = foreground, bg = background },
		the_middleground { fg = middleground, bg = background },
		the_grey { fg = grey, bg = background },

		the_dark { fg = dark, bg = background },
		the_blue { fg = blue, bg = background },
		the_magenta { fg = magenta, bg = background },
		the_red { fg = red, bg = background },
		the_brown { fg = brown, bg = background },
		the_tropic { fg = tropic, bg = background },
		the_turquoise { fg = turquoise, bg = background },

		the_black { fg = black, bg = background },
		the_crimson { fg = crimson, bg = background },
		the_salmon { fg = salmon, bg = background },
		the_cabbage { fg = cabbage, bg = background },
		the_green { fg = green, bg = background },
		the_yellow { fg = yellow, bg = background },
		the_orange { fg = orange, bg = background },
		the_azure { fg = azure, bg = background },
		the_lilac { fg = lilac, bg = background },
		the_cyan { fg = cyan, bg = background },
		the_teal { fg = teal, bg = background },
		the_white { fg = white, bg = background },


		-- statusline
		LualineNormal { fg = background, bg = blue },
		LualineInsert { fg = background, bg = azure },
		LualineVisual { fg = background, bg = lilac },
		LualineReplace { fg = background, bg = salmon },
		LualineCommand { fg = background, bg = cabbage },
		LualineB { fg = foreground, bg = middleground },
		LualineC { fg = foreground, bg = background },
		LualineInactive { fg = background, bg = grey },


		-- the actual colors
		foreground   = foreground,
		background   = background,
		middleground = middleground,
		grey         = grey,

		blue         = blue,
		magenta      = magenta,
		red          = red,
		crimson      = crimson,
		brown        = brown,
		tropic       = tropic,
		turquoise    = turquoise,

		azure        = azure,
		lilac        = lilac,
		salmon       = salmon,
		orange       = orange,
		yellow       = yellow,
		green        = cabbage,
		teal         = teal,
		cyan         = cyan,

		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		-- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = background.li(5) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		-- Directory      { }, -- Directory names (and other special names in listings)
		DiffAdd { fg = cabbage },       -- Diff mode: Added line |diff.txt|
		DiffChange { fg = cyan },       -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = red },        -- Diff mode: Deleted line |diff.txt|
		DiffText { fg = magenta },      -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = crimson, gui = 'bold' }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		LineNr { fg = azure.de(30).da(40) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		-- CursorLineNr   { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		-- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal { fg = foreground, bg = background }, -- Normal text
		NormalFloat { bg = background.da(10) },    -- Normal text in floating windows.
		FloatBorder { bg = NormalFloat.bg, fg = azure }, -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		-- Pmenu          { }, -- Popup menu: Normal item.
		-- PmenuSel       { }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		-- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { bg = orange },           -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		IncSearch { bg = brown },         -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute { bg = brown, fg = salmon }, -- |:substitute| replacement text highlighting
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		-- StatusLine     { }, -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		-- Visual         { }, -- Visual mode selection
		-- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg     { }, -- Warning messages
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- Winseparator   { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment { fg = grey.da(30) }, -- Any comment
		--
		Constant { fg = orange }, -- (*) Any constant
		String { fg = cabbage }, --   A string constant: "this is a string"
		Character { fg = salmon }, --   A character constant: 'c', '\n'
		Number { fg = lilac },  --   A number constant: 234, 0xff
		-- Boolean        { }, --   A boolean constant: TRUE, false
		-- Float          { }, --   A floating point constant: 2.3e10

		Identifier { fg = azure },       -- (*) Any variable name
		Function { fg = blue },          --   Function name (also: methods for classes)
		--
		Statement { fg = blue, gui = 'bold' }, -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		Operator { fg = foreground }, --   "sizeof", "+", "*", etc.
		-- Keyword        { }, --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc { fg = magenta, gui = 'bold' }, -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type { fg = teal, gui = 'italic' }, -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special { Type }, -- (*) Any special symbol
		-- SpecialChar    { }, --   Special character in a constant
		-- Tag            { }, --   You can use CTRL-] on this
		Delimiter { fg = yellow }, --   Character that needs attention
		-- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
		-- Debug          { }, --   Debugging statements

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { fg = crimson }, -- Any erroneous construct
		-- Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError { fg = crimson }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = orange }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = lilac }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = azure }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticOk               { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		-- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { } , -- Used for "Ok" diagnostic virtual text.
		-- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
		-- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
		-- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
		-- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
		-- DiagnosticUnderlineOk      { } , -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- sym "@text.literal" { },     -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		-- sym"@punctuation"       { }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		-- sym"@macro"             { }, -- Macro
		sym "@string" { fg = cabbage }, -- String
		sym "@string.escape" { fg = yellow }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		-- sym"@property"          { }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		sym "@variable" { fg = azure }, -- Identifier
		-- sym"@type"              { }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag

		sym "@markup.strong" { fg = blue, gui = 'bold' },          -- bold text
		sym "@markup.italic" { fg = azure, gui = 'italic' },       -- italic text
		sym "@markup.strikethrough" { fg = red, gui = 'strikethrough' }, -- struck-through text
		sym "@markup.underline" { fg = orange, gui = 'undeline' }, -- underlined text (only for literal underline markup!)
		--
		sym "@markup.heading.1" { fg = blue, gui = 'bold' },       -- headings, titles (including markers)
		sym "@markup.heading.2" { fg = azure, gui = 'bold' },      -- headings, titles (including markers)
		sym "@markup.heading.3" { fg = cyan, gui = 'bold' },       -- headings, titles (including markers)
		sym "@markup.heading.4" { fg = lilac, gui = 'bold' },      -- headings, titles (including markers)
		--
		sym "@markup.quote" { fg = azure, gui = 'italic' },        -- block quotes
		sym "@markup.math" { fg = teal },                          -- math environments (e.g. `$ ... $` in LaTeX)
		-- sym "markup.environment" {},               -- environments (e.g. in LaTeX)
		--
		sym "@markup.link" { fg = cyan }, -- text references, footnotes, citations, etc.
		-- sym "markup.link.label" {},                -- link, reference descriptions
		-- sym "markup.link.url" {},                  -- URL-style links
		--
		sym "@markup.raw" { fg = teal }, -- literal or verbatim text (e.g. inline code)
		-- sym "markup.raw.block" {},                 -- literal or verbatim text as a stand-alone block
		--
		sym "@markup.list" { fg = foreground }, -- list markers
		sym "@markup.list.checked" { fg = cabbage }, -- checked todo-style list markers
		sym "@markup.list.unchecked" { fg = red }, -- unchecked todo-style list markers

		sym "@diff.plus" { fg = cabbage },     -- added text (for diff files)
		sym "@diff.minus" { fg = red },        -- deleted text (for diff files)
		sym "@diff.delta" { fg = cyan },       -- changed text (for diff files)

		-- sym "@tag" {},                   -- XML-style tag names (e.g. in XML, HTML, etc.)
		-- sym "@tag.attribute" {},         -- XML-style tag attributes
		-- sym "@tag.delimiter" {},         -- XML-style tag delimiters
		-- barbar
		BufferCurrent { bg = background.li(10) },
		BufferCurrentMod { BufferCurrent },
		BufferInactive { bg = background, fg = foreground.da(20).de(50) },
		BufferInactiveMod { BufferInactive },
		BufferVisible { BufferInactive },
		BufferVisible { BufferInactive },

		-- telescope
		TelescopeSelection { CursorLine },
		-- TelescopeSelectionCaret {},
		TelescopeMultiSelection { bg = CursorLine.bg, fg = azure },
		-- TelescopeNormal        {},

		TelescopeBorder { FloatBorder },
		-- TelescopePromptBorder   {},
		-- TelescopeResultsBorder   {},
		-- TelescopePreviewBorder   {},

		TelescopeMatching { fg = azure },
		TelescopePromptPrefix { fg = blue },


		-- cmp
		CmpItemKindText { fg = foreground },
		CmpItemKindMethod { fg = turquoise },
		CmpItemKindFunction { fg = lilac },
		-- CmpItemKindConstructor {},
		CmpItemKindField { fg = teal },
		CmpItemKindVariable { fg = azure },
		CmpItemKindClass { fg = salmon },
		CmpItemKindInterface { fg = cyan },
		CmpItemKindModule { fg = salmon },
		CmpItemKindProperty { fg = teal.li(10).sa(10) },
		CmpItemKindUnit {},
		CmpItemKindValue {},
		CmpItemKindEnum { fg = yellow },
		CmpItemKindKeyword { fg = blue },
		CmpItemKindSnippet { fg = cabbage },
		CmpItemKindColor {},
		CmpItemKindFile { fg = orange },
		CmpItemKindReference {},
		CmpItemKindFolder { fg = CmpItemKindFile.fg.da(10).de(10) },
		CmpItemKindEnumMember { fg = yellow },
		CmpItemKindConstant { fg = red },
		CmpItemKindStruct { fg = salmon },
		CmpItemKindEvent {},
		CmpItemKindOperator {},
		CmpItemKindTypeParameter {},
	}
end)


-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
