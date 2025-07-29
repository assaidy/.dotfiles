return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local keymap = vim.keymap

            keymap.set("n", "]h", gs.next_hunk, "Next Hunk")
            keymap.set("n", "[h", gs.prev_hunk, "Prev Hunk")
            keymap.set("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
            keymap.set("n", "<leader>hd", gs.diffthis, "Diff this")
            keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, "Diff this ~")
            keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
        end,
    },
}
