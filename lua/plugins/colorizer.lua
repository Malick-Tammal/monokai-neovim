return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",

    keys = {
        { "<leader>tc", "<Cmd>ColorizerToggle<CR>" }
    },

    opts = {
        filetypes = {
            "*"
            -- "html", "css", "javascript", "typescriptreact", "tsx", "lua"
        },
        user_default_options = {
            tailwind = true,

            mode = "virtualtext",
            virtualtext = "󱓻",
            virtualtext_inline = "before",

            css = true,
            rgb_fn = true,
            hsl_fn = true,
        },
    },
}
