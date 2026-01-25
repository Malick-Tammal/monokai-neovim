return {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    version = "*",

    keys = function()
        if vim.g.vscode then return {} end
        return {
            {
                "<leader>tm",
                function()
                    local MiniFiles = require("mini.files")
                    if not MiniFiles.close() then MiniFiles.open() end
                end,
                desc = "Open Mini Files"
            },
        }
    end,

    config = function()
        require("mini.surround").setup({
            silent = true,
            mappings = {
                add = "ma",            -- Add surrounding in Normal and Visual modes
                delete = "md",         -- Delete surrounding
                find = "mf",           -- Find surrounding (to the right)
                find_left = "mF",      -- Find surrounding (to the left)
                highlight = "mh",      -- Highlight surrounding
                replace = "mr",        -- Replace surrounding
                update_n_lines = "mn", -- Update `n_lines`
                suffix_last = "l",     -- Suffix to search with "prev" method
                suffix_next = "n",     -- Suffix to search with "next" method
            },
            custom_surroundings = {
                t = {
                    input = { "<(%w+)[^<>]->.-</%1>", "^<()%w+().*</()%w+()>$" },
                    output = function()
                        local tag_name = MiniSurround.user_input(" Tag name")
                        if tag_name == nil then
                            return nil
                        end
                        return { left = tag_name, right = tag_name }
                    end,
                },
            },
        })

        require("mini.operators").setup()

        -- 3. Terminal-Only Modules (Disable in VS Code)
        if not vim.g.vscode then
            require("mini.bufremove").setup()
            require("mini.comment").setup()
            require("mini.files").setup({
                windows = {
                    preview = true,
                    width_preview = 80,
                },
                options = { permanent_delete = false }
            })
        end
    end,
}
