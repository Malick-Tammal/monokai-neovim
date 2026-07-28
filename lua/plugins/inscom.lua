return {
	"malick-tammal/inscom.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",

	opts = {
		style = "dashed",
		tag = true,
		styles_menu = true,
		tags_menu = true,
	},
}
