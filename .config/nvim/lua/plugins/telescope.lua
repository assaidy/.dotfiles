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
    end,
}
