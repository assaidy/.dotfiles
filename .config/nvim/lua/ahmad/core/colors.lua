local groups = {
	["Normal"] = { fg = "#ffffff", bg = "#181818" },
	["@Keyword"] = { fg = "gold", gui = "bold" },
	["Keyword"] = { fg = "gold", gui = "bold" },
	["Statement"] = { fg = "gold", gui = "bold" },
	["@String"] = { fg = "#09D009" },
	["String"] = { fg = "#09D009" },
	["@string.escape"] = { fg = "#2AE02A" },
	["SpecialChar"] = { fg = "#2AE02A" },
	["@Comment"] = { fg = "#008000", gui = "italic" },
	["Comment"] = { fg = "#008000", gui = "italic" },
	["@Error"] = { fg = "#ff0000" },
	["Type"] = { fg = "#abb2bf" },
	["@type"] = { fg = "#abb2bf" },
	["@type.builtin"] = { fg = "#abb2bf" },
	-- ["@function"] = { fg = "#61afef" },
	-- ["@function.builtin"] = { fg = "#61afef" },
	["@tag"] = { fg = "#A9A9A9" },
	["@tag.builtin"] = { fg = "#A9A9A9" },
	["htmlTagName"] = { fg = "#A9A9A9" },
	["htmlArg"] = { fg = "#8BC4FA" },
    ["LineNr"] = { fg = "gold", gui = "bold,italic" },
    ["LineNrAbove"] = { fg = "#505050" },
    ["LineNrBelow"] = { fg = "#505050" },
}

local function highlight(group, table)
	local fg = table.fg and table.fg or "NONE"
	local bg = table.bg and table.bg or "NONE"
	local gui = table.gui and table.gui or "NONE"

	local cmd = "highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. gui
	vim.cmd(cmd)
	-- vim.print(cmd)
end

for key, value in pairs(groups) do
	highlight(key, value)
end
