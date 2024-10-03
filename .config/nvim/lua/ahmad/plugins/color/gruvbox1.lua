return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		-- Default options:
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = false,
			italic = {
				strings = true,
				emphasis = false,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = true,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				-- Function = { fg = "#ebdbb2" },
				Function = { fg = "#8ec07c" },
				SignColumn = { bg = "NONE" },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		-- vim.cmd("colorscheme gruvbox")
	end,
}
