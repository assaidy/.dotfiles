--[[
local groups = {
    ["Normal"] = { fg = "#D1D1D1" },
    ["statusLine"] = { fg = "#D1D1D1", bg = "#282828" },
    ["@keyword"] = { fg = "gold", gui = "bold" },
    ["Keyword"] = { fg = "gold", gui = "bold" },
    ["Statement"] = { fg = "gold", gui = "bold" },
    ["@number"] = { fg = "#AF87D7" },
    ["@string"] = { fg = "#09D009" },
    ["String"] = { fg = "#09D009" },
    ["@string.escape"] = { fg = "#09D009" },
    ["Character"] = { fg = "#09D009" },
    ["SpecialChar"] = { fg = "#09D009" },
    -- ["@Comment"] = { fg = "#09D009", gui = "italic" },
    -- ["Comment"] = { fg = "#09D009", gui = "italic" },
    ["@comment"] = { fg = "#008000" },
    ["Comment"] = { fg = "#008000" },
    ["@Error"] = { fg = "#ff0000" },
    -- ["Type"] = { fg = "#FFD75F" },
    -- ["@type"] = { fg = "#FFD75F" },
    -- ["@type.builtin"] = { fg = "#FFD75F" },
    ["Type"] = { fg = "#F62B5A" },
    ["@type"] = { fg = "#F62B5A" },
    ["@type.builtin"] = { fg = "#F62B5A" },
    -- ["@property"] = { fg = "#AF87D7" },
    ["@function"] = { fg = "#AF87D7" },
    ["@function.builtin"] = { fg = "#AF87D7" },
    -- ["@function"] = { fg = "#ffffff" },
    -- ["@function.builtin"] = { fg = "#ffffff" },
    ["@tag"] = { fg = "#A9A9A9" },
    ["@tag.builtin"] = { fg = "#A9A9A9" },
    ["htmlTagName"] = { fg = "#A9A9A9" },
    ["htmlArg"] = { fg = "#8BC4FA" },
    ["LineNr"] = { fg = "gold", gui = "bold,italic" },
    ["CursorLineNr"] = { fg = "gold", gui = "bold,italic" },
    ["LineNrAbove"] = { fg = "#505050" },
    ["LineNrBelow"] = { fg = "#505050" },
}

local function highlight(group, table)
    local fg = table.fg or "NONE"
    local bg = table.bg or "NONE"
    local gui = table.gui or "NONE"

    local cmd = "highlight " .. group .. " guifg=" .. fg .. " guibg=" .. bg .. " gui=" .. gui
    vim.cmd(cmd)
end

for key, value in pairs(groups) do
    highlight(key, value)
end
]]

vim.cmd("colorscheme onedark")
