return {
    "Wansmer/treesj",
    event = { "BufReadPre", "BufNewFile" },

    -- HACK: Config
    config = function()
        local treesj = require("treesj")
        treesj.setup({
            max_join_length = 300,
            use_default_keymaps = false,
            langs = {
                qmljs = require('treesj.langs.javascript'),
            },
        })

        -- INFO: Keymaps
        vim.keymap.set("n", "<leader>w", function()
            require("treesj").toggle()
        end)

        -- WK
        local wk = require("which-key")
        wk.add({ "<leader>w", desc = "(Split / Join)", icon = { icon = " ", color = "yellow" } })
    end,
}
