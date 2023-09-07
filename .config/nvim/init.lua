require("ahmad")

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- global statusline
vim.cmd("set statusline=3")

-- current line highlighting
vim.opt.cursorline = true

-- tab indenting width
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.expandtab=true

-- ignore case sensitive
vim.opt.ignorecase = true

-- wrap line
vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- vim.cmd("colorscheme gruvbox")

