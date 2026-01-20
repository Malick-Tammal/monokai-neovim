return {
    "derektata/lorem.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<leader>Lw",
            function()
                vim.cmd("LoremIpsum words " .. vim.fn.input("Number of words")) -- Words
            end,
            desc = "Words",
        },

        {
            "<leader>Lp",
            function()
                vim.cmd("LoremIpsum paragraphs " .. vim.fn.input("Number of paragraphs")) -- Paragraphs
            end,
            desc = "Paragraphs",
        },
    },

    config = function()
        require("lorem").opts({
            sentence_length = "medium",
            comma_chance = 0.2,
            max_commas = 2,
        })
    end,
}
