return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local parsers_to_install = {
            "lua", "python", "javascript", "typescript", "tsx",
            "bash", "html", "css", "scss", "json", "yaml", "toml",
            "markdown", "markdown_inline", "vim", "vimdoc", "regex",
            "qmljs"
        }

        local ts = require("nvim-treesitter")

        ts.install(parsers_to_install)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if not lang then return end

                local has_parser = pcall(vim.treesitter.get_parser, 0, lang)

                if has_parser then
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    vim.wo.foldmethod = "expr"
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end
            end
        })
    end
}
