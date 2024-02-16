-- -- You probably always want to set this in your vim file
-- vim.opt.background = 'dark'
-- vim.g.colors_name = 'uniwa'
--
-- -- By setting our module to nil, we clear lua's cache,
-- -- which means the require ahead will *always* occur.
-- --
-- -- This isn't strictly required but it can be a useful trick if you are
-- -- incrementally editing your config a lot and want to be sure your themes
-- -- changes are being picked up without restarting neovim.
-- --
-- -- Note if you're working in on your theme and have :Lushify'd the buffer,
-- -- your changes will be applied with our without the following line.
-- --
-- -- The performance impact of this call can be measured in the hundreds of
-- -- *nanoseconds* and such could be considered "production safe".
-- package.loaded['lush_theme.uniwa'] = nil
--
-- -- include our theme file and pass it to lush to apply
-- require('lush')(require('lush_theme.uniwa'))

-- colors/uniwa.lua

local colors = {
	-- content here will not be touched
	-- PATCH_OPEN
Normal = {fg = "#BED6FA", bg = "#121C2A"},
BufferCurrent = {bg = "#212F43"},
BufferCurrentMod = {link = "BufferCurrent"},
BufferInactive = {fg = "#8CA8CE", bg = "#121C2A"},
BufferInactiveMod = {link = "BufferInactive"},
BufferVisible = {link = "BufferInactive"},
Character = {fg = "#F68895"},
CmpItemKindClass = {fg = "#F68895"},
CmpItemKindColor = {},
CmpItemKindConstant = {fg = "#B41B30"},
CmpItemKindEnum = {fg = "#E1CA46"},
CmpItemKindEnumMember = {fg = "#E1CA46"},
CmpItemKindEvent = {},
CmpItemKindField = {fg = "#79B3AF"},
CmpItemKindFile = {fg = "#E19A3C"},
CmpItemKindFolder = {fg = "#C58A45"},
CmpItemKindFunction = {fg = "#D58DEC"},
CmpItemKindInterface = {fg = "#40BAB4"},
CmpItemKindKeyword = {fg = "#215E99"},
CmpItemKindMethod = {fg = "#1C6664"},
CmpItemKindModule = {fg = "#F68895"},
CmpItemKindOperator = {},
CmpItemKindProperty = {fg = "#78BCB8"},
CmpItemKindReference = {},
CmpItemKindSnippet = {fg = "#83B83B"},
CmpItemKindStruct = {fg = "#F68895"},
CmpItemKindText = {fg = "#BED6FA"},
CmpItemKindTypeParameter = {},
CmpItemKindUnit = {},
CmpItemKindValue = {},
CmpItemKindVariable = {fg = "#68ADF4"},
Comment = {fg = "#6B6B5D"},
Constant = {fg = "#E19A3C"},
CursorLine = {bg = "#1A2638"},
TelescopeSelection = {link = "CursorLine"},
Delimiter = {fg = "#E1CA46"},
DiagnosticError = {fg = "#EA2641"},
DiagnosticHint = {fg = "#68ADF4"},
DiagnosticInfo = {fg = "#D58DEC"},
DiagnosticWarn = {fg = "#E19A3C"},
DiffAdd = {fg = "#83B83B"},
DiffChange = {fg = "#40BAB4"},
DiffDelete = {fg = "#B41B30"},
DiffText = {fg = "#9723A9"},
Error = {fg = "#EA2641"},
ErrorMsg = {fg = "#EA2641", bold = true},
FloatBorder = {fg = "#68ADF4", bg = "#111A27"},
TelescopeBorder = {link = "FloatBorder"},
Function = {fg = "#215E99"},
Identifier = {fg = "#68ADF4"},
IncSearch = {bg = "#7B541A"},
LineNr = {fg = "#426389"},
NormalFloat = {bg = "#111A27"},
Number = {fg = "#D58DEC"},
Operator = {fg = "#BED6FA"},
PreProc = {fg = "#9723A9", bold = true},
Search = {bg = "#E19A3C"},
Statement = {fg = "#215E99", bold = true},
String = {fg = "#83B83B"},
Substitute = {fg = "#F68895", bg = "#7B541A"},
TelescopeMatching = {fg = "#68ADF4"},
TelescopeMultiSelection = {fg = "#68ADF4", bg = "#1A2638"},
TelescopePromptPrefix = {fg = "#215E99"},
Type = {fg = "#79B3AF", italic = true},
Special = {link = "Type"},
["@diff.delta"] = {fg = "#40BAB4"},
["@diff.minus"] = {fg = "#B41B30"},
["@diff.plus"] = {fg = "#83B83B"},
["@markup.heading.1"] = {fg = "#215E99", bold = true},
["@markup.heading.2"] = {fg = "#68ADF4", bold = true},
["@markup.heading.3"] = {fg = "#40BAB4", bold = true},
["@markup.heading.4"] = {fg = "#D58DEC", bold = true},
["@markup.italic"] = {fg = "#68ADF4", italic = true},
["@markup.link"] = {fg = "#40BAB4"},
["@markup.list"] = {fg = "#BED6FA"},
["@markup.list.checked"] = {fg = "#83B83B"},
["@markup.list.unchecked"] = {fg = "#B41B30"},
["@markup.math"] = {fg = "#79B3AF"},
["@markup.quote"] = {fg = "#68ADF4", italic = true},
["@markup.raw"] = {fg = "#79B3AF"},
["@markup.strikethrough"] = {fg = "#B41B30", strikethrough = true},
["@markup.strong"] = {fg = "#215E99", bold = true},
["@markup.underline"] = {fg = "#E19A3C"},
["@string"] = {fg = "#83B83B"},
["@string.escape"] = {fg = "#E1CA46"},
["@variable"] = {fg = "#68ADF4"},
	-- PATCH_CLOSE
	-- content here will not be touched
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='uniwa'")

-- apply highlight groups
for group, attrs in pairs(colors) do
	vim.api.nvim_set_hl(0, group, attrs)
end
