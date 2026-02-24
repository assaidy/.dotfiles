local g = vim.g
g.netrw_liststyle = 1
g.netrw_banner = 0
g.netrw_sort_by = "exten"
g.mapleader = " "
g.maplocalleader = "\\"

local opt = vim.opt
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.mousemodel = "extend"
opt.laststatus = 3 -- global statusline
opt.relativenumber = false
opt.number = false
opt.tabstop = 2 -- spaces for tabs
opt.shiftwidth = 2 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = false -- highlight the current cursor line
-- opt.guicursor = "i:block"
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.swapfile = false
opt.autoread = true
-- auto reload files when focus is gained or window is entered
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	pattern = "*", -- all filetypes
	command = "checktime",
})
