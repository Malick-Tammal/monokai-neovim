return {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,

    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 0,
            trim_scope = 'outer',
        })
    end
}
