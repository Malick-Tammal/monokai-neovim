return {
	"supermaven-inc/supermaven-nvim",
	cond = not vim.g.vscode,
	event = "InsertEnter",
	enabled = true,

	keys = {
		{ "<leader>tS", "<Cmd>SupermavenToggle<CR>" },
	},

	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<M-k>",
			},
		})
	end,
}
