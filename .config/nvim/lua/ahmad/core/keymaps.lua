-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- open explore
keymap.set("n", "<leader>ee", ":Ex<CR>", { desc = "Open explore" })

-- go to end/start of line
keymap.set({ "n", "v" }, "gh", "0", { desc = "Goto start of the line" })
keymap.set({ "n", "v" }, "gl", "$", { desc = "Goto end of the line" })

-- buffer navigation
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Goto next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Goto previous buffer" })
keymap.set("n", "<leader>bk", ":bd<CR>", { desc = "Kill current buffer" })
keymap.set("n", "<leader>bl", ":Telescope buffers<CR>", { desc = "List open buffers inside telescope" })

-- move selected up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without change clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set({ "n", "v" }, "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set({ "n", "v" }, "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>sm", "<C-w>_ <bar> <C-w>|", { desc = "Maximize current split" }) -- maximize current split
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Kill all other splits" }) -- kill all other splits
keymap.set("n", "<leader>sk", "<C-w>c", { desc = "Kill current split" }) -- kill current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tk", "<cmd>tabclose<CR>", { desc = "Kill current tab" }) -- kill current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Goto next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Goto previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
