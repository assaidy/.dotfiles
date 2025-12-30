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
        layout_strategy = "vertical",
        layout_config = {
          height = 1000,
          width = 1000,
          preview_cutoff = 30,   -- force preview even in center
          prompt_position = "bottom",
        },
        -- borderchars = {
        --     prompt   = {"─","│"," ","│","╭","╮","│","│"},
        --     results  = {"─","│","─","│","│","│","╯","╰"},
        --     preview  = {"─","│","─","│","╭","╮","╯","╰"},
        -- },
      },

      pickers = {
        find_files = {
          find_command = {
            "fd",
            "--no-ignore",
            "--hidden",
            "--exclude=.git",
            "-t",
            "f",
          },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
