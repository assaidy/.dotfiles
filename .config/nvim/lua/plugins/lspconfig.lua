return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                keymap.set("n", "gr", ":Telescope lsp_references<CR>", { desc = "LSP show references" })
                keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "LSP show definitions" })
                keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "LSP show implementations" })
                keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", { desc = "LSP show type definitions" })
                keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP show code actions" })
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
                keymap.set("n", "<leader>wd", "<cmd>Telescope diagnostics<CR>",
                    { desc = "Fuzzy find worksapce diagnostic" })
                keymap.set("n", "<leader>bd", ":Telescope diagnostics bufnr=0<CR>",
                    { desc = "LSP show buffer diagnostics" })
                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP show line diagnostics" })
                keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP previous diagnostic" })
                keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "LSP next diagnostic" })
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "LSP restart" })
            end,
        })

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = "", texthl = hl, numhl = "" })
        end

        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })
    end,
}
