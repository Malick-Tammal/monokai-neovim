return {
	"nguyenvukhang/nvim-toggler",
	event = "VeryLazy",

	config = function()
		require("nvim-toggler").setup({
			inverses = {
				["vim"] = "emacs",
				["left"] = "right",
				["top"] = "bottom",
				["open"] = "close",
			},
		})
	end,
}
