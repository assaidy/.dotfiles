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

-- Align.nvim-style: align to the farthest match of a Vim regex in a visual range
-- vim.api.nvim_create_user_command("Align", function(opts)
--   local pattern = opts.args
--   if pattern == nil or pattern == "" then
--     vim.notify("Usage: :Align {pattern}", vim.log.levels.ERROR)
--     return
--   end
--
--   -- range provided by the command
--   local l1 = opts.line1
--   local l2 = opts.line2
--
--   -- get lines
--   local buf = 0
--   local lines = vim.api.nvim_buf_get_lines(buf, l1 - 1, l2, false)
--
--   -- compile Vim regex
--   local ok, rgx = pcall(vim.regex, pattern)
--   if not ok then
--     vim.notify("Invalid pattern: " .. tostring(pattern), vim.log.levels.ERROR)
--     return
--   end
--
--   -- find rightmost match start index (0-based) for each line
--   local starts = {}
--   local max_start = -1
--   for i, line in ipairs(lines) do
--     local lastpos = nil
--     local search_from = 1
--     -- repeatedly search the remainder for successive matches, update lastpos
--     while search_from <= #line do
--       local sub = line:sub(search_from)
--       local m = rgx:match_str(sub)  -- returns 0-based index in sub or nil
--       if not m then break end
--       -- absolute 0-based index in the whole line
--       lastpos = (search_from - 1) + m
--       -- advance one character past this match start to find a later match
--       -- (we intentionally move by 1 rather than by match length to handle zero-length matches safely)
--       search_from = lastpos + 2
--     end
--     starts[i] = lastpos  -- may be nil
--     if lastpos and lastpos > max_start then max_start = lastpos end
--   end
--
--   if max_start < 0 then
--     -- nothing matched, do nothing
--     vim.notify("No matches for pattern: " .. pattern, vim.log.levels.WARN)
--     return
--   end
--
--   -- produce new lines with padding before the match start so all starts equal max_start
--   local out = {}
--   for i, line in ipairs(lines) do
--     local pos = starts[i]
--     if not pos then
--       table.insert(out, line) -- no change if no match on that line
--     else
--       -- pos is 0-based index of match start; convert to 1-based for string ops
--       local pos1 = pos + 1
--       local needed = max_start - pos
--       if needed <= 0 then
--         table.insert(out, line)
--       else
--         local before = line:sub(1, pos1 - 1)
--         local after = line:sub(pos1)
--         -- insert needed spaces before 'after'
--         table.insert(out, before .. string.rep(" ", needed) .. after)
--       end
--     end
--   end
--
--   -- write back
--   vim.api.nvim_buf_set_lines(buf, l1 - 1, l2, false, out)
-- end, { nargs = 1, range = true, desc = "Align selected lines to farthest match of a Vim regex" })
