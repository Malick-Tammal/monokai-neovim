return {
    "nvzone/typr",
    cond = not vim.g.vscode,
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
}
