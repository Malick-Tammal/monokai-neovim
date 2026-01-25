return {
    "nvim-lualine/lualine.nvim",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    enabled = true,

    dependencies = {
        "bwpge/lualine-pretty-path",
    },

    config = function()
        local hide_in_width = function()
            return vim.fn.winwidth(0) > 100
        end

        local mode = {
            "mode",
            separator = { left = "" },
            fmt = function(str)
                return " " .. str .. " "
            end,
        }

        local filename = {
            "filename",
            file_status = true,
            path = 0,
            symbols = {
                modified = "󰷈",
                readonly = "󰈡",
            },
            fmt = function(str)
                return " " .. str
            end,
        }

        local progress = {
            "progress",
            separator = { right = "" },
            left_padding = 2,
            fmt = function(str)
                return " " .. str
            end,
        }

        local location = {
            "location",
            fmt = function(str)
                return str .. " "
            end,
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
            colored = true,
            update_in_insert = false,
            always_visible = false,
            cond = hide_in_width,
        }

        local diff = {
            "diff",
            colored = false,
            symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
            cond = hide_in_width,
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                section_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = { "alpha", "snacks_dashboard", "dashboard" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = { "pretty_path" }, -- filename
                lualine_d = {
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
                lualine_x = {
                    diagnostics,
                    diff,
                    { "encoding", cond = hide_in_width },
                    { "filetype", cond = hide_in_width },
                    {
                        "fileformat",
                        symbols = {
                            unix = " ",
                        },
                    },
                },
                lualine_y = { location },
                lualine_z = { progress },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { { "location", padding = 0 } },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "neo-tree" },
        })
    end,
}
