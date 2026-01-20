return {
    "gbprod/yanky.nvim",
    event = { "BufReadPre", "BufNewFile" },

    keys = {
        { "<leader>y", function() require("telescope").extensions.yank_history.yank_history() end, desc = "Open Yank History" },
    },

    opts = {
        highlight = {
            on_put = true,
            on_yank = true,
            timer = 200,
        },
        picker = {
            telescope = {
                use_default_mappings = true,
                mappings = nil
            },
        },
    },
}
