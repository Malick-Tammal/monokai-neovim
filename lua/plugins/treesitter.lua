return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            local languages = {
                "lua", "python", "javascript", "typescript", "tsx",
                "bash", "html", "css", "scss", "json", "yaml", "toml",
                "markdown", "markdown_inline", "vim", "vimdoc", "regex"
            }
            for _, lang in ipairs(languages) do
                if not vim.treesitter.language.get_lang(lang) then
                    ts.install(lang)
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("TSHighlightFix", { clear = true }),
                callback = function(args)
                    local ft = vim.bo[args.buf].filetype

                    local lang = vim.treesitter.language.get_lang(ft) or ft

                    local ok = pcall(vim.treesitter.start, args.buf, lang)

                    if ok and (ft == "css" or ft == "scss") then
                        vim.api.nvim_set_hl(0, "@property.css", { link = "Special" })
                        vim.api.nvim_set_hl(0, "@tag.css", { link = "Keyword" })
                        vim.api.nvim_set_hl(0, "@type.css", { link = "Type" })
                        vim.api.nvim_set_hl(0, "@variable.css", { link = "Identifier" })
                    end
                end,
            })
        end,
    },
}
