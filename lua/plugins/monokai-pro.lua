return {
    "loctvl842/monokai-pro.nvim",
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

                    -- print(vim.inspect(c))

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

                    PmenuSel = { bg = c.base.blue, fg = c.base.dark },

                    CmpItemKindSnippet = { fg = c.base.red },
                    CmpItemKindFunction = { fg = c.base.magenta },
                    CmpItemKindVariable = { fg = c.base.yellow },
                    CmpItemKindText = { fg = c.base.green },

                    -- vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "none" })

                    BlinkCmpMenu = { bg = c.base.black, fg = c.base.dimmed1 },
                    BlinkCmpMenuSelection = { bg = c.base.blue, fg = c.base.dark },

                    BlinkCmpKindFunction = { fg = c.base.magenta },
                    BlinkCmpKindVariable = { fg = c.base.yellow },
                    BlinkCmpKindText = { fg = c.base.green },
                    BlinkCmpKindSnippet = { fg = c.base.red },

                    -- Highlight relative number
                    CursorLineNr = { fg = c.base.yellow },
                    CursorLine = { bg = c.base.dimmed5 },

                    -- Indent line and highlight active
                    -- SnacksIndent = { fg = c.base.dimmed3 },
                    SnacksIndentScope = { fg = c.base.green },

                    -- Notify
                    NotifyINFOBody = { bg = c.editor.background },
                    NotifyINFOBorder = { bg = c.editor.background, fg = c.base.cyan },
                    NotifyERRORBody = { bg = c.editor.background },
                    NotifyERRORBorder = { bg = c.editor.background, fg = c.base.red },
                    NotifyWARNBody = { bg = c.editor.background },
                    NotifyWARNBorder = { bg = c.editor.background, fg = c.base.yellow },

                    -- Yanky
                    YankyYanked = { bg = c.base.red, fg = c.base.dark },
                    YankyPut = { bg = c.yellow, fg = c.base.dark },

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
                    SnacksIndent = { fg = c.base.dimmed3 },
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
