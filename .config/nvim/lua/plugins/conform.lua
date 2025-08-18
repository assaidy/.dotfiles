return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettier" },
				javascript = { "prettier" },
			},

			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
		})

		vim.api.nvim_create_user_command("Fmt", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format current buffer" })

		vim.keymap.set({ "n" }, "<leader>fm", ":Fmt<CR>", { desc = "Format current buffer" })
	end,
}
