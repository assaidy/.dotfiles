return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,     -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
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

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers theme=ivy<cr>", { desc = "Fuzzy find open buffers" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Fuzzy find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string theme=ivy<cr>",
            { desc = "Fuzzy find string under cursor in cwd" })
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags theme=ivy<cr>", { desc = "Fuzzy find help" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope theme=ivy<cr>", { desc = "Fuzzy find todos" })
        keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics theme=ivy<cr>",
            { desc = "Fuzzy find worksapce diagnostic" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols theme=ivy query=<cr>",
            { desc = "Fuzzy find document symbols" })
    end,
}
