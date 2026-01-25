return {
    "DaikyXendo/nvim-material-icon",
    cond = not vim.g.vscode,
    event = { "BufReadPre", "BufNewFile" },
}
