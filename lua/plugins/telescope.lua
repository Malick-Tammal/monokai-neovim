return {
	"nvim-telescope/telescope.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	--  INFO: Keymaps
	keys = {
		{ "<leader><space>", "<Cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
		{ "<leader>G", "<Cmd>Telescope live_grep<CR>", desc = "Telescope Live Grep" },
		{ "<leader>bf", "<Cmd>Telescope buffers<CR>", desc = "Telescope Buffers" },
		{ "<leader>h", "<Cmd>Telescope help_tags<CR>", desc = "Telescope Help Tags" },
	},

	--  INFO: Config
	config = function()
		local tele = require("telescope")
		tele.setup({
			winblend = 10,
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "  ",
				path_display = { "smart" },
				borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		--  TIP: Extensions
		tele.load_extension("fzf")
	end,
}
