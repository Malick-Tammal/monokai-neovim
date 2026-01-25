return {
    "yutkat/confirm-quit.nvim",
    cond = not vim.g.vscode,
    event = "CmdlineEnter",
    opts = {},
}
