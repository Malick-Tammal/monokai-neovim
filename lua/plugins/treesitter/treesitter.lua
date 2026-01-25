return {
    "nvim-treesitter/nvim-treesitter",
    -- cond = not vim.g.vscode,
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
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
                if not lang then return end

                local has_parser = pcall(vim.treesitter.get_parser, 0, lang)

                if has_parser then
                    if not vim.g.vscode then
                        vim.treesitter.start(args.buf, lang)
                        vim.wo.foldmethod = "expr"
                        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    end
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end
        })
    end
}
