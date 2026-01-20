--
--  HACK: Lazy
--

-----------------------------------------------------------
--  INFO: Bootstrap lazy.nvim
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
--  INFO: Setup lazy.nvim
-----------------------------------------------------------
require("lazy").setup({
    spec = {
        { import = "plugins" },
        { import = "plugins.lsp" },
        { import = "plugins.cmp" },
        { import = "plugins.treesitter" },
    },

    defaults = {
        lazy = true,
        version = false,
    },

    install = { colorscheme = { "nvchad" } },

    -- Auto update plugins
    checker = { enabled = false, notify = false },

    -- UI tweaks
    ui = {
        border = "rounded",
        size = {
            width = 0.8,
            height = 0.8,
        },
    },

    change_detection = { enabled = false },

    -- For performance
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
