return {
    "barrett-ruth/live-server.nvim",
    event = { "BufReadPre", "BufNewFile" },
    build = "npm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },

    keys = {
        { "<leader>ts", "<cmd>LiveServerToggle<cr>", desc = "Live Server Toggle" },
    },

    config = true,
}
