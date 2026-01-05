return {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
        require("tailwindcss-colorizer-cmp").setup({
            color_square_width = 2,
        })
    end,
}
