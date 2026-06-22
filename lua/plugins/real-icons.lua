return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIconsInstallPack material",
	cond = not vim.g.vscode,
	-- event = "VeryLazy",

	opts = {
		pack = "material",
		integrations = {
			telescope = true,
			neo_tree = true,
			bufferline = true,
			mini_files = true,
			telescope_file_browser = true,
		},
	},
}
