return {
	"gbprod/yanky.nvim",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 200,
		},
	},
}
