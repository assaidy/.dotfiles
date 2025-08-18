local g = vim.g
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sort_by = 'exten'
g.mapleader = " "
g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.mousemodel = "extend"
opt.laststatus = 3                  -- global statusline
opt.relativenumber = true
opt.number = true
opt.tabstop = 4        -- 4 spaces for tabs
opt.shiftwidth = 4     -- 4 spaces for indent width
opt.expandtab = true   -- expand tab to spaces
opt.autoindent = true  -- copy indent from current line when starting new one
opt.wrap = false
opt.ignorecase = true  -- ignore case when searching
opt.smartcase = true   -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = false -- highlight the current cursor line
-- opt.guicursor = "i:block"
opt.termguicolors = true
opt.background = "dark"            -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"             -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.splitright = true              -- split vertical window to the right
opt.splitbelow = true              -- split horizontal window to the bottom
opt.swapfile = false
opt.autoread = true
-- auto reload files when focus is gained or window is entered
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    pattern = "*", -- all filetypes
    command = "checktime",
})

local keymap = vim.keymap
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>ee", ":Ex<CR>", { desc = "Open explore" })
keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format current buffer" })
keymap.set({ "n", "v" }, "gh", "0", { desc = "Goto start of the line" })
keymap.set({ "n", "v" }, "gl", "$", { desc = "Goto end of the line" })
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Goto next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Goto previous buffer" })
keymap.set("n", "<leader>bk", ":bd<CR>", { desc = "Kill current buffer" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without changing clipboard" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set({ "n", "v" }, "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set({ "n", "v" }, "<leader>-", "<C-x>", { desc = "Decrement number" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sm", "<C-w>_ <bar> <C-w>|", { desc = "Maximize current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Kill all other splits" })
keymap.set("n", "<leader>sk", "<C-w>c", { desc = "Kill current split" })
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tk", ":tabclose<CR>", { desc = "Kill current tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Goto next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Goto previous tab" })
keymap.set("n", "<leader>tf", ":tabnew %<CR>", { desc = "Open current buffer in new tab" })

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

require("config.lazy")
