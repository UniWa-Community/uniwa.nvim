local lushwright = require("shipwright.transform.lush")
local helpers = require("shipwright.transform.helpers")
local wezterm = require 'shipwright.transform.contrib.wezterm'
local alacritty = require 'shipwright.transform.contrib.alacritty'

---Filter groups that start with strings in @startswith
---@param startswith table|string
---@return function
local function filter_groups(startswith)
	-- coerce to table
	if type(startswith) == "string" then
		startswith = { startswith }
	end
	return function(groups)
		local res = {}
		for group, hl in pairs(groups) do
			local filter = false
			for _, str in ipairs(startswith) do
				if string.find(group, "^" .. str) then
					filter = true
				end
			end
			if not filter then
				res[group] = hl
				-- else
				-- print(string.format("Filtered: [%s] = %s", group, hl))
			end
		end
		return res
	end
end

--- Converts parsed lush spec to a lualine theme
---@param groups table
---@return table
local function to_lualine(groups)
	local colors = {}
	for name, color in pairs(groups) do
		local start, stop = string.find(name, "^Lualine") -- keep only Lualine* groups
		if start and stop then
			name = string.sub(name, stop + 1)       -- remove "Lualine"
			colors[name] = {
				fg = color.fg.hex,
				bg = color.bg.hex,
			}
		end
	end
	return {
		normal = { a = colors.Normal, b = colors.B, c = colors.C, },
		insert = { a = colors.Insert, b = colors.B, c = colors.C, },
		visual = { a = colors.Visual, b = colors.B, c = colors.C, },
		replace = { a = colors.Replace, b = colors.B, c = colors.C, },
		command = { a = colors.Command, b = colors.B, c = colors.C, },
		inactive = { a = colors.Inactive, b = colors.B, c = colors.C, }
	}
end

--- Converts parsed lush spec to a table for contrib.wezterm
---@param groups table
---@return table
local function to_term(groups)
	local colors = {}
	for name, color in pairs(groups) do
		local start, stop = string.find(name, "^the_") -- keep only the_*
		if start and stop then
			name = string.sub(name, stop + 1)    -- remove "Lualine"
			colors[name] = color.fg.hex
		end
	end
	return {
		fg = colors.foreground,
		bg = colors.background,
		cursor_fg = colors.background,
		cursor_bg = colors.foreground,
		cursor_border = colors.brown,
		selection_fg = colors.background,
		selection_bg = colors.middleground,
		bright_black = colors.black,
		bright_red = colors.crimson,
		bright_green = colors.green,
		bright_yellow = colors.orange,
		bright_blue = colors.blue,
		bright_magenta = colors.lilac,
		bright_cyan = colors.teal,
		bright_white = colors.grey,
		black = colors.dark,
		red = colors.salmon,
		green = colors.cabbage,
		yellow = colors.yellow,
		blue = colors.azure,
		magenta = colors.lilac,
		cyan = colors.cyan,
		white = colors.white,
	}
end

local function to_string(tbl)
	local function recurse(tbl, indent)
		local value = ""
		for k, v in pairs(tbl) do
			value = value .. string.rep("    ", indent)
			if type(v) == "table" then
				value = value .. k .. " = " .. "{\n" .. recurse(v, indent + 1)
				value = value .. string.rep("    ", indent) .. "},\n"
			elseif type(v) == "string" then
				value = value .. k .. ' = "' .. v .. '",\n'
			elseif type(v) == "number" then
				value = value .. k .. ' = ' .. v .. ',\n'
			elseif type(v) == "boolean" then
				value = value .. k .. ' = ' .. v .. ',\n'
			else
				print(string.format("error: can't convert the type <%s>", type(v)))
			end
		end
		return value
	end
	return recurse(tbl, 1)
end

---convert lua table to strings of lua code
---@param tbl table
---@param add_braces ?boolean
---@return string
local function table_to_lua(tbl, add_braces)
	if add_braces == nil then
		add_braces = false
	end
	local res
	if add_braces then
		res = '{\n' .. to_string(tbl) .. "}"
	else
		res = to_string(tbl)
	end
	return res
end

local function table_to_lines_of_lua(tbl)
	return helpers.split_newlines(table_to_lua(tbl, false))
end

---@diagnostic disable: undefined-global
for _, variant in ipairs({ "dark", "light", "default" }) do
	-- unload package first, so it's loaded again,
	-- taking into account the new vim.g.uniwa_variant global
	package.loaded["lush_theme.uniwa"] = nil
	vim.g.uniwa_variant = variant -- evil global

	local uniwa = require 'lush_theme.uniwa'

	-- appended to non default variants' filenames
	local variant_filename = ""
	if variant ~= "default" then
		variant_filename = "-" .. variant
	end
	run(uniwa,
		-- filter out the the_<color> groups, since they are only used for :Lushify'ed previewing
		-- also the Lualine groups, since they are only used for the lualine theme
		filter_groups({ "the", "Lualine" }),
		-- generate lua code
		lushwright.to_lua,
		-- write the lua code into our destination.
		-- you must specify open and close markers yourself to account
		-- for differing comment styles, patchwrite isn't limited to lua files.
		{ patchwrite, "colors/uniwa" .. variant_filename .. ".lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

	run(uniwa,
		to_lualine,     -- get lualine theme
		table_to_lines_of_lua, -- turn into string of lua code
		{ patchwrite, "lua/lualine/themes/uniwa" .. variant_filename .. ".lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

	run(uniwa,
		to_term, -- get wezterm theme
		{ branch,
			wezterm,
			{ overwrite, "extra/wezterm" .. variant_filename .. ".toml" }
		},
		{ branch,
			alacritty,
			{ overwrite, "extra/alacritty" .. variant_filename .. ".yaml" }
		}
	)
end
