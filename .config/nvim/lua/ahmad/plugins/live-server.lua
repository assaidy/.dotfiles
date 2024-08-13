return {
	"barrett-ruth/live-server.nvim",
	build = "pnpm add -g live-server",
	config = function()
		require("live-server").setup()
	end,
}
