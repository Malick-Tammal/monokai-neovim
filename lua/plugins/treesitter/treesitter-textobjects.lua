return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },

    init = function()
        vim.g.no_plugin_maps = true
    end,

    config = function()
        require("nvim-treesitter-textobjects").setup {
            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    -- ['@class.outer'] = '<c-v>', -- blockwise
                },
                include_surrounding_whitespace = false,
            },
        }
    end,
}
