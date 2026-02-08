return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	enabled = true,

	config = function()
		require("neoscroll").setup({
			easing_function = "linear",
			hide_cursor = true,
			stop_eof = true,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
		})
	end,
}
