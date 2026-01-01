return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	-- dependencies = {
	-- 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- },
	event = "VeryLazy",

	-- HACK: Config
	config = function()
		local tele = require("telescope")
		tele.setup({
			winblend = 10,
			-- extensions = {
			-- 	fzf = {},
			-- },
			-- pickers = {
			-- 	find_files = {
			-- 		find_command = { "rg", "--files", "--color", "never", "--no-require-git" },
			-- 	},
			-- },
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "  ",
				path_display = { "smart" },
				borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
			},
		})

		-- INFO: Extensions
		-- tele.load_extension("fzf")
	end,
}
