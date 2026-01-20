return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",

    --  INFO: Keymaps
    keys = {
        { "<leader><space>", "<Cmd>Telescope find_files<CR>", desc = "Telescope Find Files" },
        { "<leader>G",       "<Cmd>Telescope live_grep<CR>",  desc = "Telescope Live Grep" },
        { "<leader>bf",      "<Cmd>Telescope buffers<CR>",    desc = "Telescope Buffers" },
        { "<leader>h",       "<Cmd>Telescope help_tags<CR>",  desc = "Telescope Help Tags" },
    },

    --  INFO: Config
    config = function()
        local tele = require("telescope")
        tele.setup({
            winblend = 10,
            defaults = {
                prompt_prefix = "  ",
                selection_caret = "  ",
                path_display = { "smart" },
                borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
            },
        })

        --  TIP: Extensions
        -- tele.load_extension("fzf")
    end,
}
