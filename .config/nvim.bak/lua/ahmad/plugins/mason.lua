return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- mason_lspconfig.setup({
        --     -- list of servers for mason to install
        --     ensure_installed = {
        --         "css-lsp",
        --         "gopls",
        --         "html-lsp",
        --         "lua-language-server",
        --         "prettier",
        --         "pyright",
        --         "stylua",
        --         "typescript-language-server",
        --     },
        -- })

        mason_tool_installer.setup({
            ensure_installed = {
                "gopls",
                "zls",
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "prettier",
                "typescript-language-server",
                -- "eslint_d",
                "pyright",
            },
        })
    end,
}
