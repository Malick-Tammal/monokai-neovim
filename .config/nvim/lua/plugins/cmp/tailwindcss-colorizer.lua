return {
	"roobert/tailwindcss-colorizer-cmp.nvim",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		require("tailwindcss-colorizer-cmp").setup({
			-- Optional settings:
			color_square_width = 2, -- Width of the color square
		})
	end,
}
