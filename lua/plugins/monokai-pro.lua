--  INFO: Settings custom color foe "nvim-cmp"
local lspkind = function(c)
    local kind_colors = {
        Text = c.editor.foreground,
        Method = c.base.cyan,
        Function = c.base.magenta,
        Constructor = c.base.yellow,
        Field = c.base.red,
        Variable = c.base.red,
        Class = c.base.yellow,
        Interface = c.base.green,
        Module = c.base.cyan,
        Property = c.base.ctan,
        Unit = c.base.dimmed2,
        Value = c.base.blue,
        Enum = c.base.yellow,
        Keyword = c.base.magenta,
        Snippet = c.base.green,
        Color = c.base.blue,
        File = c.base.dimmed2,
        Reference = c.base.dimmed2,
        Folder = c.base.cyan,
        EnumMember = c.base.cyan,
        Constant = c.base.blue,
        Struct = c.base.blue,
        Event = c.base.red,
        Operator = c.base.dimmed2,
        TypeParameter = c.base.yellow,
    }

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
            for kind, color in pairs(kind_colors) do
                -- "CmpItemKind" + "Function" = "CmpItemKindFunction"
                vim.api.nvim_set_hl(0, "CmpItemKind" .. kind, { fg = color, force = true })
            end
        end,
    })

    for kind, color in pairs(kind_colors) do
        vim.api.nvim_set_hl(0, "CmpItemKind" .. kind, { fg = color, force = true })
    end
end


return {
    "loctvl842/monokai-pro.nvim",
    cond = not vim.g.vscode,
    lazy = false,
    priority = 9999,

    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
            background_clear = {
                "renamer",
                "notify",
                "fidget",
            },

            --  TIP: Custom highlights
            override = function(c)
                lspkind(c)
                return {
                    BufferLineIndicatorSelected = { bg = c.base.blue, fg = c.base.dark },
                    BufferLineNeoTree = { bg = c.base.dark, fg = c.base.dimmed3 },
                    BufferLineFill = { bg = c.base.black },
                    BufferLineCloseButtonSelected = { fg = c.base.dimmed1 },
                    BufferLineBuffer = { link = "Quote" },
                    BufferLineBufferSelected = { link = "Quote" },
                    BufferLineBufferVisible = { link = "Quote" },
                    BufferLineBackground = {
                        bold = false,
                        bg = c.tab.inactiveBackground,
                        fg = c.tab.inactiveForeground,
                    },

                    -- print(vim.inspect(c)),

                    -- Telescope
                    TelescopeNormal = { bg = c.base.black },
                    TelescopePreviewNormal = { bg = c.base.black },
                    TelescopeResultsNormal = { bg = c.base.black },
                    TelescopePromptNormal = { bg = c.base.black },

                    TelescopeBorder = { fg = c.base.black },
                    TelescopePreviewBorder = { fg = c.base.black },
                    TelescopeResultsBorder = { fg = c.base.black },
                    TelescopePromptBorder = { fg = c.base.black },

                    TelescopeResultsTitle = { bg = c.base.red, fg = c.base.dimmed5 },
                    TelescopePreviewTitle = { bg = c.base.yellow, fg = c.base.dimmed5 },
                    TelescopePromptTitle = { bg = c.base.blue, fg = c.base.dimmed5 },

                    TelescopeSelection = { fg = c.base.blue },

                    -- Cmp ( Completion menu )
                    CmpPmenu = { bg = c.base.dark, fg = c.base.dimmed1 },
                    CmpDocNormal = { bg = c.base.dark, fg = c.base.dimmed1 },
                    CmpItemMenu = { fg = c.base.dimmed3 },

                    PmenuSel = { bg = c.base.yellow, fg = c.base.dark },

                    CmpMenuBorder = { bg = "none", fg = c.base.dimmed3 },

                    BlinkCmpMenu = { bg = c.base.black, fg = c.base.dimmed1 },
                    BlinkCmpMenuSelection = { bg = c.base.blue, fg = c.base.dark },

                    BlinkCmpKindFunction = { fg = c.base.magenta },
                    BlinkCmpKindVariable = { fg = c.base.yellow },
                    BlinkCmpKindText = { fg = c.base.green },
                    BlinkCmpKindSnippet = { fg = c.base.red },

                    -- Highlight relative number
                    CursorLineNr = { fg = c.base.yellow },
                    CursorLine = { bg = c.base.gray },

                    -- Indent line and highlight active
                    SnacksIndentScope = { fg = c.base.green },
                    SnacksIndent = { fg = c.base.dimmed5 },

                    -- Notify
                    NotifyINFOBody = { bg = c.editor.background },
                    NotifyINFOBorder = { bg = c.editor.background, fg = c.base.cyan },
                    NotifyERRORBody = { bg = c.editor.background },
                    NotifyERRORBorder = { bg = c.editor.background, fg = c.base.red },
                    NotifyWARNBody = { bg = c.editor.background },
                    NotifyWARNBorder = { bg = c.editor.background, fg = c.base.yellow },

                    -- Yanky
                    YankyYanked = { bg = c.base.blue, fg = c.base.dark },
                    YankyPut = { bg = c.base.yellow, fg = c.base.dark },

                    -- Mini icons
                    MiniIconsAzure = { fg = c.base.cyan },
                    MiniIconsBlue = { fg = c.base.cyan },
                    MiniIconsCyan = { fg = c.base.cyan },
                    MiniIconsGreen = { fg = c.base.green },
                    MiniIconsOrange = { fg = c.base.blue },
                    MiniIconsPurple = { fg = c.base.magenta },
                    MiniIconsRed = { fg = c.base.red },
                    MiniIconsYellow = { fg = c.base.yellow },

                    -- Folded text
                    Folded = { fg = c.base.yellow, bg = c.base.dimmed5 },

                    -- Scrollbar
                    FloatTitle = { fg = c.base.red, bg = c.base.dimmed3 },
                    CursorIndicator = { fg = c.base.cyan },

                    SnacksExplorerBorder = { fg = c.base.blue, bg = c.base.dark },
                    SnacksExplorerNormal = { fg = c.base.dimmed2, bg = c.base.dark },
                    SnacksPickerDirectory = { fg = c.base.dimmed2, bg = "none" },

                    SnacksPickerInputTitle = { fg = c.base.red, bg = c.base.blue },
                    SnacksDashboardText = { fg = c.base.dimmed2 },

                    -- Mini files
                    MiniFilesBorder = { fg = c.base.dimmed3, bg = c.base.black },
                    MiniFilesTitleFocused = { fg = c.base.black, bg = c.base.green },
                    MiniFilesTitle = { fg = c.base.dimmed1, bg = c.base.dimmed4 },

                    -- Which key
                    WhichKeyNormal = { fg = c.base.dimmed1, bg = c.base.black },

                    NoiceCmdlinePopupBorderCmdline = { fg = c.base.blue },
                    -- RenamerNormal = { fg = c.base.dimmed1, bg = c.base.dark },
                }
            end,
        })

        vim.cmd([[colorscheme monokai-pro]])
    end,
}
