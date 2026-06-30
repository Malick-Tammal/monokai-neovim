return {
	"catgoose/nvim-colorizer.lua",
	cond = not vim.g.vscode,
	event = "BufReadPre",

	keys = {
		{ "<leader>tc", "<Cmd>ColorizerToggle<CR>" },
	},

	opts = {
		filetypes = {
			"*",
		},
		user_default_options = {
			tailwind = true,

			mode = "virtualtext",
			virtualtext = "󱓻",
			virtualtext_inline = "before",

			css = true,
			rgb_fn = true,
			hsl_fn = true,
			names = false,
		},
	},
}
