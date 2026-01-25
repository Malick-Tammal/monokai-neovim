return {
    "nguyenvukhang/nvim-toggler",
    cond = not vim.g.vscode,
    event = "VeryLazy",

    keys = {
        { "<leader>tw", function() require("nvim-toggler").toggle() end },
    },

    config = function()
        require("nvim-toggler").setup({
            remove_default_keybinds = true,
            inverses = {
                ["vim"] = "emacs",
                ["left"] = "right",
                ["top"] = "bottom",
                ["open"] = "close",
            },
        })
    end,
}
