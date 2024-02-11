local uniwa = require('lush_theme.uniwa')

local colors = {
    foreground = uniwa.the_foreground.fg.hex,
    background = uniwa.the_background.fg.hex,
    grey = uniwa.the_grey.fg.hex,
    blue = uniwa.the_blue.fg.hex,
    magenta = uniwa.the_magenta.fg.hex,
    red = uniwa.the_red.fg.hex,
    crimson = uniwa.the_crimson.fg.hex,
    brown = uniwa.the_brown.fg.hex,
    tropic = uniwa.the_tropic.fg.hex,
    turquoise = uniwa.the_turquoise.fg.hex,
    azure = uniwa.the_azure.fg.hex,
    lilac = uniwa.the_lilac.fg.hex,
    salmon = uniwa.the_salmon.fg.hex,
    orange = uniwa.the_orange.fg.hex,
    yellow = uniwa.the_yellow.fg.hex,
    green = uniwa.the_green.fg.hex,
    teal = uniwa.the_teal.fg.hex,
    cyan = uniwa.the_cyan.fg.hex,
}

return {
    normal = {
        a = { bg = colors.blue, fg = colors.background, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.background },
        c = { bg = colors.background, fg = colors.gray }
    },
    insert = {
        a = { bg = colors.green, fg = colors.background, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.background },
        c = { bg = colors.background, fg = colors.foreground }
    },
    visual = {
        a = { bg = colors.lilac, fg = colors.background, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.background },
        c = { bg = colors.background, fg = colors.foreground }
    },
    replace = {
        a = { bg = colors.crimson, fg = colors.background, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.background },
        c = { bg = colors.background, fg = colors.foreground }
    },
    command = {
        a = { bg = colors.cyan, fg = colors.background, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.background },
        c = { bg = colors.background, fg = colors.foreground }
    },
    inactive = {
        a = { bg = colors.grey, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.grey, fg = colors.gray },
        c = { bg = colors.background, fg = colors.gray }
    }
}
