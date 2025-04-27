return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use the latest version
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                -- normal = "<leader>sa",
                -- normal_cur = "<leader>sc",
                -- normal_line = "<leader>sA",
                -- normal_cur_line = "<leader>sC",
                visual = "<leader>sa",
                delete = "<leader>sd",
                change = "<leader>sc",
            },
        })
    end
}
