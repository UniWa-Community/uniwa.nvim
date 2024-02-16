local lushwright = require("shipwright.transform.lush")

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
			else
				print(string.format("Filtered: [%s] = %s", group, hl))
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

local function get_value(tbl, indent)
	if indent == nil then
		indent = 1
	end
	local value = ""
	for k, v in pairs(tbl) do
		if indent ~= 0 then
			value = value .. string.rep("    ", indent)
		end
		if type(v) == "table" then
			value = value .. k .. " = " .. "{\n" .. get_value(v, indent + 1)
			if indent ~= 0 then
				value = value .. string.rep("    ", indent) .. "},\n"
			end
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

---puts @thing in a table :^)
---@param thing any
---@return table
local function tableit(thing)
	return { thing }
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
		res = '{\n' .. get_value(tbl) .. "}"
	else
		res = get_value(tbl)
	end
	return tableit(res)
end


run(require("lush_theme.uniwa"),
	-- filter out the the_<color> groups, since they are only used for :Lushify'ed previewing
	-- also the Lualine groups, since they are only used for the lualine theme
	filter_groups({ "the", "Lualine" }),
	-- generate lua code
	lushwright.to_lua,
	-- write the lua code into our destination.
	-- you must specify open and close markers yourself to account
	-- for differing comment styles, patchwrite isn't limited to lua files.
	{ patchwrite, "colors/uniwa.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

run(require("lush_theme.uniwa"),
	-- show,
	to_lualine, -- get lualine theme
	table_to_lua, -- turn into string of lua code
	{ patchwrite, "lua/lualine/themes/uniwa.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
