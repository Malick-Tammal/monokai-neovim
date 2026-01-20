return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            rename = {
                auto_save = true,
                project_max_width = 60,
            },
            lightbulb = {
                enable = false,
                sign = false,
                virtual_text = true,
            },
        })
    end,
}
