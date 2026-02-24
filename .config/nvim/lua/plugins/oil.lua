return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	-- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	opts = {
		columns = {
			"permissions",
			"size",
			"mtime",
			"icon",
		},
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
		},
	},
}
