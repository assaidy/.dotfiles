local keymap = vim.keymap
----------------------------------------------------
-- Builtins
----------------------------------------------------
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>ee", "<cmd>Ex<cr>", { desc = "Open explore" })
-- keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format current buffer" })
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without changing clipboard" })
keymap.set("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Clear search highlights" })

keymap.set({ "n", "v" }, "H", "0", { desc = "Goto start of the line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Goto end of the line" })

keymap.set("v", "J", "<cmd>m '>+1<cr>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", "<cmd>m '<-2<cr>gv=gv", { desc = "Move selection up" })

keymap.set({ "n", "v" }, "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set({ "n", "v" }, "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Goto next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Goto previous buffer" })
keymap.set("n", "<leader>bk", "<cmd>bd<cr>", { desc = "Kill current buffer" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sm", "<C-w>_ <bar> <C-w>|", { desc = "Maximize current split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Kill all other splits" })
keymap.set("n", "<leader>sk", "<C-w>c", { desc = "Kill current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap.set("n", "<leader>tk", "<cmd>tabclose<cr>", { desc = "Kill current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Goto next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Goto previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })

----------------------------------------------------
-- Plugins
----------------------------------------------------
-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find open buffers" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy find string under cursor in cwd" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Fuzzy find help" })

-- LSP
keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP show references" })
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP show definitions" })
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP show implementations" })
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "LSP show type definitions" })
keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP show document symbols" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP show code actions" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<cr>", { desc = "Fuzzy find worksapce diagnostic" })
keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "LSP show buffer diagnostics" })
keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP show line diagnostics" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "LSP next diagnostic" })
keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", { desc = "LSP restart" })

-- Conform Formatting
keymap.set({ "n" }, "<leader>fm", "<cmd>Fmt<cr>", { desc = "Conform Format current buffer" })

-- TODO Comments
local todo_comments = require("todo-comments")
keymap.set("n", "]t", todo_comments.jump_next, { desc = "Next todo comment" })
keymap.set("n", "[t", todo_comments.jump_prev, { desc = "Previous todo comment" })
keymap.set("n", "<leader>ft", "<cmd>Telescope todo-comments<cr>", { desc = "Fuzzy find todos" })

-- Yazi
keymap.set("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Open yazi at the current file" })
keymap.set("n", "<leader>Y", "<cmd>Yazi cwd<cr>", { desc = "Open yazi at the current working directory" })

-- Oil
keymap.set("n", "<leader>ee", "<cmd>Oil<cr>", { desc = "Open Oil at the current file" })
