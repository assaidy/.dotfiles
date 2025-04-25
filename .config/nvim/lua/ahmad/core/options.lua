vim.cmd("let g:netrw_liststyle = 1")
vim.cmd("let g:netrw_sort_by = 'exten'")

local opt = vim.opt -- for conciseness

opt.mousemodel = "extend"

-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = false         -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4       -- 4 spaces for tabs
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
-- opt.cursorline = true -- highlight the current cursor line

-- original vim cursor shape (blink cursor)
-- opt.guicursor = block

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- enable autoread
vim.opt.autoread = true
-- auto reload files when focus is gained or window is entered
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
    pattern = "*", -- all filetypes
    command = "checktime",
})
