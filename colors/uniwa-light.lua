local colors = {
	-- content here will not be touched
	-- PATCH_OPEN
Normal = {fg = "#121C2A", bg = "#FFF5E8"},
BufferCurrent = {bg = "#FFF5E8"},
BufferCurrentMod = {link = "BufferCurrent"},
BufferInactive = {fg = "#14181E", bg = "#FFF5E8"},
BufferInactiveMod = {link = "BufferInactive"},
BufferVisible = {link = "BufferInactive"},
Character = {fg = "#BA2041"},
CmpItemKindClass = {fg = "#BA2041"},
CmpItemKindColor = {},
CmpItemKindConstant = {fg = "#700D1A"},
CmpItemKindEnum = {fg = "#B19E35"},
CmpItemKindEnumMember = {fg = "#B19E35"},
CmpItemKindEvent = {},
CmpItemKindField = {fg = "#446765"},
CmpItemKindFile = {fg = "#83581F"},
CmpItemKindFolder = {fg = "#745025"},
CmpItemKindFunction = {fg = "#9436AB"},
CmpItemKindInterface = {fg = "#226B67"},
CmpItemKindKeyword = {fg = "#11385F"},
CmpItemKindMethod = {fg = "#0E3D3C"},
CmpItemKindModule = {fg = "#BA2041"},
CmpItemKindOperator = {},
CmpItemKindProperty = {fg = "#4B7774"},
CmpItemKindReference = {},
CmpItemKindSnippet = {fg = "#4A6A1E"},
CmpItemKindStruct = {fg = "#BA2041"},
CmpItemKindText = {fg = "#121C2A"},
CmpItemKindTypeParameter = {},
CmpItemKindUnit = {},
CmpItemKindValue = {},
CmpItemKindVariable = {fg = "#266499"},
Comment = {fg = "#6B6B5D"},
Constant = {fg = "#83581F"},
CursorLine = {bg = "#FFF5E8"},
TelescopeSelection = {link = "CursorLine"},
Delimiter = {fg = "#B19E35"},
DiagnosticError = {fg = "#AF1A2F"},
DiagnosticHint = {fg = "#266499"},
DiagnosticInfo = {fg = "#9436AB"},
DiagnosticWarn = {fg = "#83581F"},
DiffAdd = {fg = "#4A6A1E"},
DiffChange = {fg = "#226B67"},
DiffDelete = {fg = "#700D1A"},
DiffText = {fg = "#5D1269"},
Error = {fg = "#AF1A2F"},
ErrorMsg = {fg = "#AF1A2F", bold = true},
FloatBorder = {fg = "#266499", bg = "#FFD484"},
TelescopeBorder = {link = "FloatBorder"},
Function = {fg = "#11385F"},
Identifier = {fg = "#266499"},
IncSearch = {bg = "#4B320C"},
LineNr = {fg = "#273D56"},
NormalFloat = {bg = "#FFD484"},
Number = {fg = "#9436AB"},
Operator = {fg = "#121C2A"},
PreProc = {fg = "#5D1269", bold = true},
Search = {bg = "#83581F"},
Statement = {fg = "#11385F", bold = true},
String = {fg = "#4A6A1E"},
Substitute = {fg = "#BA2041", bg = "#4B320C"},
TelescopeMatching = {fg = "#266499"},
TelescopeMultiSelection = {fg = "#266499", bg = "#FFF5E8"},
TelescopePromptPrefix = {fg = "#11385F"},
Type = {fg = "#446765", italic = true},
Special = {link = "Type"},
["@diff.delta"] = {fg = "#226B67"},
["@diff.minus"] = {fg = "#700D1A"},
["@diff.plus"] = {fg = "#4A6A1E"},
["@markup.heading.1"] = {fg = "#11385F", bold = true},
["@markup.heading.2"] = {fg = "#266499", bold = true},
["@markup.heading.3"] = {fg = "#226B67", bold = true},
["@markup.heading.4"] = {fg = "#9436AB", bold = true},
["@markup.italic"] = {fg = "#266499", italic = true},
["@markup.link"] = {fg = "#226B67"},
["@markup.list"] = {fg = "#121C2A"},
["@markup.list.checked"] = {fg = "#4A6A1E"},
["@markup.list.unchecked"] = {fg = "#700D1A"},
["@markup.math"] = {fg = "#446765"},
["@markup.quote"] = {fg = "#266499", italic = true},
["@markup.raw"] = {fg = "#446765"},
["@markup.strikethrough"] = {fg = "#700D1A", strikethrough = true},
["@markup.strong"] = {fg = "#11385F", bold = true},
["@markup.underline"] = {fg = "#83581F"},
["@string"] = {fg = "#4A6A1E"},
["@string.escape"] = {fg = "#B19E35"},
["@variable"] = {fg = "#266499"},
	-- PATCH_CLOSE
	-- content here will not be touched
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("set background=light")
vim.cmd("let g:colors_name='uniwa-light'")

-- apply highlight groups
for group, attrs in pairs(colors) do
	vim.api.nvim_set_hl(0, group, attrs)
end
