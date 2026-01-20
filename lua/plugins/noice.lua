return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        presets = {
            bottom_search = true,
            lsp_doc_border = true,
            long_message_to_split = true,
            inc_rename = true,
        },
        health = {
            checker = false,
        },
        lsp = {
            signature = {
                auto_open = { enabled = false },
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
    },
}
