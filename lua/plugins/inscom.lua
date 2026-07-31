return {
	-- "malick-tammal/inscom.nvim",
	dir = "/home/malick-tammal/Projects/inscom.nvim/",

	cond = not vim.g.vscode,
	event = "VeryLazy",

	opts = {
		style = "dashed",
		tag = true,
		styles_menu = true,
		tags_menu = true,
	},
}
