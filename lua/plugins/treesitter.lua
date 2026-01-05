return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",

        config = function()
            local ts = require("nvim-treesitter")

            ts.install({
                "lua", "python", "javascript", "typescript", "tsx",
                "bash", "html", "css", "scss", "json", "yaml", "toml",
                "markdown", "markdown_inline", "vim", "vimdoc", "regex"
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua", "python", "javascript", "typescript", "typescriptreact", "tsx",
                    "sh", "bash", "html", "css", "scss", "json", "yaml", "toml",
                    "markdown", "vim"
                },
                callback = function()
                    vim.treesitter.start()
                end,
            })
        end,
    },
}
