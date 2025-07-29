return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
            },
            pickers = {
                find_files = {
                    find_command = {
                        "fd",
                        "--no-ignore",
                        "--hidden",
                        "--exclude=.git",
                        "-t", "f",
                    },
                    -- disable_devicons = true,
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Fuzzy find open buffers" })
        keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
        keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>",
            { desc = "Fuzzy find string under cursor in cwd" })
        keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Fuzzy find help" })
        keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Fuzzy find todos" })
        keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { desc = "Fuzzy find document symbols" })
    end,
}
