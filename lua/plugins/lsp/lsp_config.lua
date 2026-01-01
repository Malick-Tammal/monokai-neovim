return {
    -- HACK: LSPs config
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        enabled = true,

        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", enabled = true },
        },

        config = function()
            -- HACK: LSPs

            -- INFO: LSPs configs

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            })

            vim.lsp.config("emmet_ls", {
                filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "svelte", "vue" },
                showSuggestionsAsSnippets = true,
            })

            -- INFO: LSPs activation
            vim.lsp.enable({
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
                "emmet_ls",
                "rust_analyzer",
                "tailwindcss",
                "bashls",
                "hyprls",
            })
        end,
    },

    -- HACK: Diagnostic config
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "modern",
                transparent_bg = false,
                transparent_cursorline = false,
                signs = {
                    diag = "󱓻",
                },
                hi = {
                    mixing_color = "CursorColumn",
                },
                options = {
                    use_icons_from_diagnostic = true,

                    multilines = {
                        enabled = true,
                        always_show = false,
                    },
                },
                disabled_ft = {}, -- List of filetypes to disable the plugin
            })

            -- Change the Diagnostic symbols
            vim.diagnostic.config({
                underline = false,
                virtual_text = false,
                update_in_insert = false,
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                        [vim.diagnostic.severity.INFO] = " ",
                    },
                },
            })
        end,
    },
}
