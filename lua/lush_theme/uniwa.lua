--
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

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush        = require('lush')
local hsl         = lush.hsl
local hsluv       = lush.hsluv

local uniwa_blue  = hsluv(249, 89, 24) -- uniwa blue
local uniwa_lblue = hsluv(246, 87, 69) -- uniwa light blue
local uniwa_grey  = hsluv(86, 22, 64)  -- uniwa tan

local foreground  = uniwa_lblue.lighten(50)
local background  = uniwa_blue.da(60).de(40)

-- local black
local grey        = uniwa_grey

local base_1      = uniwa_blue.li(20)

local blue        = base_1
local magenta     = base_1.ro(50)
local red         = base_1.ro(120)
local crimson     = base_1.ro(120).li(20)
local brown       = base_1.ro(160)
local tropic      = base_1.ro(240)
local turquoise   = base_1.ro(300)

local base_2      = uniwa_lblue

local azure       = base_2
local lilac       = base_2.ro(50).de(10)
local salmon      = base_2.ro(120)
local orange      = base_2.ro(160)
local yellow      = base_2.ro(188).li(40).sa(10)
local green       = base_2.ro(225)
local teal        = base_2.ro(300).de(40)
local cyan        = base_2.ro(300)


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
    local sym = injected_functions.sym
    return {
        the_foreground { fg = foreground, bg = foreground },
        the_background { fg = background, bg = background },
        the_grey { fg = grey, bg = grey },

        the_blue { fg = blue, bg = blue },
        the_magenta { fg = magenta, bg = magenta },
        the_red { fg = red, bg = red },
        the_crimson { fg = crimson, bg = crimson },
        the_brown { fg = brown, bg = brown },
        the_tropic { fg = tropic, bg = tropic },
        the_turquoise { fg = turquoise, bg = turquoise },

        the_azure { fg = azure, bg = azure },
        the_lilac { fg = lilac, bg = lilac },
        the_salmon { fg = salmon, bg = salmon },
        the_orange { fg = orange, bg = orange },
        the_yellow { fg = yellow, bg = yellow },
        the_green { fg = green, bg = green },
        the_teal { fg = teal, bg = teal },
        the_cyan { fg = cyan, bg = cyan },
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
        DiffAdd { fg = green },               -- Diff mode: Added line |diff.txt|
        DiffChange { fg = cyan },             -- Diff mode: Changed line |diff.txt|
        DiffDelete { fg = red },              -- Diff mode: Deleted line |diff.txt|
        DiffText { fg = magenta },            -- Diff mode: Changed text within a changed line |diff.txt|
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
        Normal { fg = foreground, bg = background },     -- Normal text
        NormalFloat { bg = background.da(10) },          -- Normal text in floating windows.
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
        Search { bg = orange },                 -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        IncSearch { bg = brown },               -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
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
        Constant { fg = orange },     -- (*) Any constant
        String { fg = green },        --   A string constant: "this is a string"
        Character { fg = salmon },    --   A character constant: 'c', '\n'
        Number { fg = lilac },        --   A number constant: 234, 0xff
        -- Boolean        { }, --   A boolean constant: TRUE, false
        -- Float          { }, --   A floating point constant: 2.3e10

        Identifier { fg = azure },             -- (*) Any variable name
        Function { fg = blue },                --   Function name (also: methods for classes)
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
        -- Delimiter      { }, --   Character that needs attention
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
        DiagnosticWarn { fg = orange },   -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticInfo { fg = lilac },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
        DiagnosticHint { fg = azure },    -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
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
        -- sym"@string"            { }, -- String
        -- sym"@string.escape"     { }, -- SpecialChar
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
        TelescopeMultiSelection { CursorLine },
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
        CmpItemKindSnippet { fg = green },
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
