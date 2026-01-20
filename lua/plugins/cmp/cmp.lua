-- Kind icons
local kind_icons = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "",
    Constructor = "",
    Field = "󰜢",
    Variable = "󱄑",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
}

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",

    dependencies = {
        -- 1. Core Sources (You were missing cmp-nvim-lsp)
        "hrsh7th/cmp-nvim-lsp", -- REQUIRED for LSP completion
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "octaltree/cmp-look",

        -- 2. Snippet Engine
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",

        -- 3. UI & Extras (You were missing the colorizer plugin repo)
        "onsails/lspkind.nvim",
        "lukas-reineke/cmp-under-comparator",
        "roobert/tailwindcss-colorizer-cmp.nvim", -- REQUIRED for the tailwind formatter
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
        local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu, menuone, preview",
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            window = {
                completion = {
                    border = "rounded",
                    winhighlight = "Normal:CmpPmenu,FloatBorder:CmpMenuBorder,CursorLine:PmenuSel,Search:None",
                    side_padding = 1,
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpMenuBorder",
                },
            },

            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-d>"] = cmp.mapping.abort(),
            }),

            sources = cmp.config.sources({
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "calc" },
                { name = "emoji" },
                { name = "look",    keyword_length = 2 },
            }),

            -- formatting = {
            --     fields = { "kind", "abbr", "menu" },
            --
            --     -- Complex menu
            --     -- format = function(entry, vim_item)
            --     --     local kind_icon = lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or ""
            --     --     -- vim_item.kind = kind_icon
            --     --     vim_item.kind = string.format("%s %s", kind_icon, vim_item.kind)
            --     --     vim_item.abbr = " " .. vim_item.abbr -- two spaces; adjust as needed
            --     --     vim_item.menu = ({
            --     --         nvim_lsp = "[LSP]",
            --     --         buffer = "[BUF]",
            --     --         path = "[PATH]",
            --     --         luasnip = "[SNIP]",
            --     --     })[entry.source.name] or ""
            --     --     return vim_item
            --     -- end,
            --
            --     -- Simple menu
            --     format = function(entry, vim_item)
            --         local icon = lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or ""
            --         vim_item.kind = icon
            --         vim_item.abbr = " " .. vim_item.abbr
            --         vim_item = tailwind_formatter.formatter(entry, vim_item)
            --         return vim_item
            --     end,
            -- },

            formatting = {
                fields = { "kind", "abbr", "menu" },

                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 20,
                    ellipsis_char = "...",

                    before = function(entry, vim_item)
                        vim_item.abbr = " " .. vim_item.abbr
                        vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")

                        vim_item = tailwind_formatter(entry, vim_item)

                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snip]",
                            buffer = "[Buf]",
                            path = "[Path]",
                            emoji = "[Emoji]",
                        })[entry.source.name]


                        return vim_item
                    end
                })
            },

            --  INFO: Ghost text
            experimental = {
                ghost_text = false,
            },

            sorting = {
                comparators = {
                    require("cmp-under-comparator").under,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        })
    end,
}
