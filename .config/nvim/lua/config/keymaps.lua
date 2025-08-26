local keymap = vim.keymap
----------------------------------------------------
-- Builtins
----------------------------------------------------
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>ee", "<cmd>Ex<CR>", { desc = "Open explore" })
keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format current buffer" })
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without changing clipboard" })
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

keymap.set({ "n", "v" }, "gh", "0", { desc = "Goto start of the line" })
keymap.set({ "n", "v" }, "gl", "$", { desc = "Goto end of the line" })

keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move selection up" })

keymap.set({ "n", "v" }, "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set({ "n", "v" }, "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Goto next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Goto previous buffer" })
keymap.set("n", "<leader>bk", "<cmd>bd<CR>", { desc = "Kill current buffer" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sm", "<C-w>_ <bar> <C-w>|", { desc = "Maximize current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Kill all other splits" })
keymap.set("n", "<leader>sk", "<C-w>c", { desc = "Kill current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tk", "<cmd>tabclose<CR>", { desc = "Kill current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Goto next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Goto previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

----------------------------------------------------
-- Plugins
----------------------------------------------------
-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find open buffers" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find string under cursor in cwd" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Fuzzy find help" })

-- Conform Formatting
keymap.set({ "n" }, "<leader>fm", "<cmd>Fmt<CR>", { desc = "Conform Format current buffer" })

-- LSP
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP show references" })
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP show definitions" })
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP show implementations" })
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "LSP show type definitions" })
keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP show document symbols" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP show code actions" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<CR>", { desc = "Fuzzy find worksapce diagnostic" })
keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "LSP show buffer diagnostics" })
keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP show line diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "LSP next diagnostic" })
keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "LSP restart" })

-- TODO Comments
local todo_comments = require("todo-comments")
keymap.set("n", "]t", todo_comments.jump_next, { desc = "Next todo comment" })
keymap.set("n", "[t", todo_comments.jump_prev, { desc = "Previous todo comment" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Fuzzy find todos" })

-- Multicursor
local mc = require("multicursor-nvim")
keymap.set({ "n", "x" }, "<leader>k", function()
	mc.lineAddCursor(-1)
end, { desc = "Add cursor above the main cursor" })
keymap.set({ "n", "x" }, "<leader>j", function()
	mc.lineAddCursor(1)
end, { desc = "Add cursor below the main cursor" })
keymap.set({ "n", "x" }, "<leader>K", function()
	mc.lineSkipCursor(-1)
end, { desc = "Skip cursor above the main cursor" })
keymap.set({ "n", "x" }, "<leader>J", function()
	mc.lineSkipCursor(1)
end, { desc = "Skip cursor below the main cursor" })

keymap.set({ "n", "x" }, "<leader>n", function()
	mc.matchAddCursor(1)
end, { desc = "Add cursor for the next match" })
keymap.set({ "n", "x" }, "<leader>p", function()
	mc.matchAddCursor(-1)
end, { desc = "Add cursor for the previous match" })
keymap.set({ "n", "x" }, "<leader>N", function()
	mc.matchSkipCursor(1)
end, { desc = "Skip cursor for the next match" })
keymap.set({ "n", "x" }, "<leader>P", function()
	mc.matchSkipCursor(-1)
end, { desc = "Skip cursor for the previous match" })

keymap.set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Click to add cursor" })
keymap.set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Drag to add cursor" })
keymap.set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Relase to stop adding cursors" })

keymap.set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle cursor" })
-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "<left>", mc.prevCursor)
	layerSet({ "n", "x" }, "<right>", mc.nextCursor)

	-- Delete the main cursor.
	layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)
