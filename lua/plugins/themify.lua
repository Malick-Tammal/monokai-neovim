-----------------------------------------------------------
--  HACK: Theme Switcher (Themify)
-----------------------------------------------------------
return {
    "lmantw/themify.nvim",

    lazy = false,
    priority = 999,
    enabled = false,

    --
    --  INFO: Themes
    --

    config = function()
        -- TODO: Setting Highlights ( changing some ui colors )

        local function setHl(palette, colorScheme)
            if colorScheme == "tokyonight" then
                -- Buffer line
                vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.red, fg = palette.bg })
                vim.api.nvim_set_hl(0, "BufferLineNeoTree", { bg = palette.bg_dark1, fg = palette.warning })
                vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.black })

                -- Telescope
                vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.red, fg = palette.bg })
                vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.yellow, fg = palette.bg })
                vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.orange, fg = palette.bg })
                vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

                -- Cmp ( Completion menu )
                vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg })
                vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.bg })
                vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.red, fg = palette.bg })
                vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "NONE", fg = "NONE" })

                -- Highlight relative number
                vim.api.nvim_set_hl(0, "LineNr", { fg = palette.blue2 })

                -- Indent line and highlight active
                vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.grey0 })
                vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.orange })

                -- Notify
                vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = palette.none })
                vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = palette.none, fg = palette.info })
                vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = palette.none })
                vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = palette.none, fg = palette.error })
                vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = palette.none })
                vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = palette.none, fg = palette.warning })

                -- Yanky
                vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.hint, fg = palette.bg })
                vim.api.nvim_set_hl(0, "YankyPut", { bg = palette.warning, fg = palette.bg })

                --  INFO: Monokai pro
            elseif colorScheme == "monokai-pro" then
                -- Buffer line
                vim.api.nvim_set_hl(
                    0,
                    "BufferLineIndicatorSelected",
                    { bg = palette.base.blue, fg = palette.base.dark }
                )
                vim.api.nvim_set_hl(
                    0,
                    "BufferLineNeoTree",
                    { bg = palette.base.dark, fg = palette.base.dimmed3 }
                )
                vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.base.black })
                vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { fg = palette.base.dimmed1 })
                vim.api.nvim_set_hl(0, "BufferLineBuffer", { link = "Quote" })
                vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { link = "Quote" })
                vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { link = "Quote" })
                vim.api.nvim_set_hl(
                    0,
                    "BufferLineBackground",
                    { bold = false, bg = palette.tab.inactiveBackground, fg = palette.tab.inactiveForeground }
                )

                -- print(vim.inspect(palette))

                -- Telescope
                vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = palette.base.black })

                vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = palette.base.black })
                vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = palette.base.black })

                vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.base.red, fg = palette.base.dimmed5 })
                vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.base.yellow, fg = palette.base.dimmed5 })
                vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.base.blue, fg = palette.base.dimmed5 })

                vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.base.blue })

                -- Cmp ( Completion menu )
                vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.base.dark, fg = palette.base.dimmed1 })
                vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.base.dark, fg = palette.base.dimmed1 })

                vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.base.blue, fg = palette.base.dark })

                vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = palette.base.red })
                vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = palette.base.magenta })
                vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = palette.base.yellow })
                vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = palette.base.green })

                -- vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "none" })

                vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = palette.base.black, fg = palette.base.dimmed1 })
                vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = palette.base.blue, fg = palette.base.dark })

                vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = palette.base.magenta })
                vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = palette.base.yellow })
                vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = palette.base.green })
                vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = palette.base.red })

                -- Highlight relative number
                vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.base.yellow })
                vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.base.dimmed5 })

                -- Indent line and highlight active
                vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.base.dimmed3 })
                vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.base.green })

                -- Notify
                vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = palette.editor.background })
                vim.api.nvim_set_hl(0, "NotifyINFOBorder", { bg = palette.editor.background, fg = palette.base.cyan })
                vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = palette.editor.background })
                vim.api.nvim_set_hl(0, "NotifyERRORBorder", { bg = palette.editor.background, fg = palette.base.red })
                vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = palette.editor.background })
                vim.api.nvim_set_hl(0, "NotifyWARNBorder", { bg = palette.editor.background, fg = palette.base.yellow })

                -- Yanky
                vim.api.nvim_set_hl(0, "YankyYanked", { bg = palette.base.red, fg = palette.base.dark })
                vim.api.nvim_set_hl(0, "YankyPut", { bg = palette.yellow, fg = palette.base.dark })

                -- Mini icons
                vim.api.nvim_set_hl(0, "MiniIconsAzure", { fg = palette.base.cyan })
                vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = palette.base.cyan })
                vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = palette.base.cyan })
                vim.api.nvim_set_hl(0, "MiniIconsGreen", { fg = palette.base.green })
                vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = palette.base.blue })
                vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = palette.base.magenta })
                vim.api.nvim_set_hl(0, "MiniIconsRed", { fg = palette.base.red })
                vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = palette.base.yellow })

                -- Folded text
                vim.api.nvim_set_hl(0, "Folded", { fg = palette.base.yellow, bg = palette.base.dimmed5 })

                -- Scrollbar
                vim.api.nvim_set_hl(0, "FloatTitle", { fg = palette.base.red, bg = palette.base.dimmed3 })
                vim.api.nvim_set_hl(0, "CursorIndicator", { fg = palette.base.cyan })

                vim.api.nvim_set_hl(0, "SnacksExplorerBorder", { fg = palette.base.blue, bg = palette.base.dark })
                vim.api.nvim_set_hl(0, "SnacksExplorerNormal", { fg = palette.base.dimmed2, bg = palette.base.dark })
                vim.api.nvim_set_hl(0, "SnacksPickerDirectory", { fg = palette.base.dimmed2, bg = "none" })

                vim.api.nvim_set_hl(0, "SnacksPickerInputTitle", { fg = palette.base.red, bg = palette.base.blue })
                vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.base.dimmed5 })
                vim.api.nvim_set_hl(0, "SnacksDashboardText", { fg = palette.base.dimmed2 })

                -- Mini files
                vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = palette.base.dimmed3, bg = palette.base.black })
                vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = palette.base.black, bg = palette.base.green })
                vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = palette.base.dimmed1, bg = palette.base.dimmed4 })

                -- Which key
                vim.api.nvim_set_hl(0, "WhichKeyNormal", { fg = palette.base.dimmed1, bg = palette.base.black })

                vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderCmdline", { fg = palette.base.blue })
                -- vim.api.nvim_set_hl(0, "RenamerNormal", { fg = palette.base.dimmed1, bg = palette.base.dark })
            else
                -- Buffer line
                vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = palette.orange, fg = palette.bg_dim })
                vim.api.nvim_set_hl(0, "BufferLineNeoTree", { bg = palette.bg_dim, fg = palette.grey2 })
                vim.api.nvim_set_hl(0, "BufferLineFill", { bg = palette.bg_dim })

                -- Telescope
                vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = palette.green, fg = palette.bg3 })
                vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = palette.orange, fg = palette.bg3 })
                vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = palette.yellow, fg = palette.bg3 })
                vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = palette.orange })

                -- Cmp ( Completion menu )
                vim.api.nvim_set_hl(0, "CmpPmenu", { bg = palette.bg_dim })
                vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = palette.bg_dim })
                vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.green, fg = palette.bg3 })

                vim.api.nvim_set_hl(0, "CmpMenuBorder", { bg = "none" })

                -- Highlight relative number
                vim.api.nvim_set_hl(0, "LineNr", { fg = palette.aqua })

                -- Indent line and highlight active
                vim.api.nvim_set_hl(0, "SnacksIndent", { fg = palette.grey0 })
                vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = palette.orange })
            end
        end

        local colors

        require("themify").setup({
            {
                --
                --  TODO: Everforest
                --

                "neanias/everforest-nvim",

                before = function()
                    require("everforest").setup({
                        -- Options (hard/ medium / soft)
                        background = "hard",
                        transparent_background_level = 0,
                        ui_contrast = "high",
                        float_style = "dim",

                        on_highlights = function(hl, palette)
                            colors = palette
                        end,
                    })
                end,

                -- Settings colors
                after = function()
                    setHl(colors)
                end,
            },

            --
            --  TODO: Gruvbox material
            --

            {
                "sainnhe/gruvbox-material",

                before = function()
                    vim.g.gruvbox_material_background = "hard"

                    vim.api.nvim_create_autocmd("ColorScheme", {
                        group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
                        pattern = "gruvbox-material",
                        callback = function()
                            local config = vim.fn["gruvbox_material#get_configuration"]()
                            local palette = vim.fn["gruvbox_material#get_palette"](
                                config.background,
                                config.foreground,
                                config.colors_override
                            )

                            for k, v in pairs(palette) do
                                palette[k] = v[1]
                            end

                            colors = palette
                        end,
                    })
                end,

                -- Settings colors
                after = function()
                    setHl(colors)
                end,
            },
            {
                "folke/tokyonight.nvim",

                before = function()
                    local palette = require("tokyonight.colors").setup()

                    colors = palette
                end,

                -- Settings colors
                after = function()
                    setHl(colors, "tokyonight")
                end,
            },
            {
                "loctvl842/monokai-pro.nvim",

                before = function()
                    require("monokai-pro").setup({
                        transparent_background = true,
                        background_clear = {
                            -- "float_win",
                            -- "toggleterm",
                            -- "telescope",
                            -- "which-key",
                            "renamer",
                            "notify",
                            "fidget",
                        },
                        override = function(c)
                            colors = c
                            -- print(vim.inspect(c))
                        end,
                    })
                end,

                -- Settings colors
                after = function()
                    setHl(colors, "monokai-pro")
                end,
            },
        })
    end,
}
