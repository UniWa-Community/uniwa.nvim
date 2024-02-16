
return {
	-- PATCH_OPEN
    inactive = {
        a = {
            bg = "#9C9C88",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },
    replace = {
        a = {
            bg = "#B41B30",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },
    visual = {
        a = {
            bg = "#D58DEC",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },
    command = {
        a = {
            bg = "#40BAB4",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },
    normal = {
        a = {
            bg = "#215E99",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },
    insert = {
        a = {
            bg = "#83B83B",
            fg = "#121C2A",
        },
        c = {
            bg = "#121C2A",
            fg = "#BED6FA",
        },
        b = {
            bg = "#4675A9",
            fg = "#121C2A",
        },
    },

	-- PATCH_CLOSE
}

-- local uniwa = require('lush_theme.uniwa')

-- local colors = {}
-- for name, color in pairs(uniwa) do
-- 	local start, stop = string.find(name, "^the_.")
-- 	if start and stop then
-- 		name = string.sub(name, stop) -- remove "the_"
-- 		colors[name] = color.fg.hex
-- 	end
-- end

-- return {
-- 	normal = {
-- 		a = { bg = colors.blue, fg = colors.background, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.background },
-- 		c = { bg = colors.background, fg = colors.gray }
-- 	},
-- 	insert = {
-- 		a = { bg = colors.green, fg = colors.background, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.background },
-- 		c = { bg = colors.background, fg = colors.foreground }
-- 	},
-- 	visual = {
-- 		a = { bg = colors.lilac, fg = colors.background, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.background },
-- 		c = { bg = colors.background, fg = colors.foreground }
-- 	},
-- 	replace = {
-- 		a = { bg = colors.crimson, fg = colors.background, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.background },
-- 		c = { bg = colors.background, fg = colors.foreground }
-- 	},
-- 	command = {
-- 		a = { bg = colors.cyan, fg = colors.background, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.background },
-- 		c = { bg = colors.background, fg = colors.foreground }
-- 	},
-- 	inactive = {
-- 		a = { bg = colors.middleground, fg = colors.gray, gui = 'bold' },
-- 		b = { bg = colors.middleground, fg = colors.gray },
-- 		c = { bg = colors.background, fg = colors.gray }
-- 	}
-- }
