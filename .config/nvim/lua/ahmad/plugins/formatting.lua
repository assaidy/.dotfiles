return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                -- lua = { "stylua" },
            },
            -- format_on_save = {
            -- 	lsp_fallback = true,
            -- 	async = false,
            -- 	timeout_ms = 1000,
            -- },
        })

        vim.keymap.set({ "n" }, "<leader>fm", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format current buffer" })
    end,
}
