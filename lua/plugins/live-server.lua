return {
	"barrett-ruth/live-server.nvim",
	event = { "BufReadPre", "BufNewFile" },
	build = "npm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
