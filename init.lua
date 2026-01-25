--
--  HACK: init
--

if vim.g.vscode then
    require("code.init")
    require("config.lazy")
else
    require("config.lazy")
    require("config.options")
    require("config.keymaps")
    require("config.autocmds")
end
