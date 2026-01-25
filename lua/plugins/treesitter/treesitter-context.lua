return {
    "nvim-treesitter/nvim-treesitter-context",
    cond = not vim.g.vscode,
    lazy = false,

    config = function()
        require("treesitter-context").setup({
            enable = true,
            max_lines = 0,
            trim_scope = 'outer',
        })
    end
}
