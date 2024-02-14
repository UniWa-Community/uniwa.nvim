local uniwa = require('lush_theme.uniwa')

local colors = {}
for name, color in pairs(uniwa) do
	local start, stop = string.find(name, "^the_.")
	if start and stop then
		name = string.sub(name, stop) -- remove "the_"
		colors[name] = color.fg.hex
	end
end


return {
	normal = {
		a = { bg = colors.blue, fg = colors.background, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.background },
		c = { bg = colors.background, fg = colors.gray }
	},
	insert = {
		a = { bg = colors.green, fg = colors.background, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground }
	},
	visual = {
		a = { bg = colors.lilac, fg = colors.background, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground }
	},
	replace = {
		a = { bg = colors.crimson, fg = colors.background, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground }
	},
	command = {
		a = { bg = colors.cyan, fg = colors.background, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground }
	},
	inactive = {
		a = { bg = colors.middleground, fg = colors.gray, gui = 'bold' },
		b = { bg = colors.middleground, fg = colors.gray },
		c = { bg = colors.background, fg = colors.gray }
	}
}
