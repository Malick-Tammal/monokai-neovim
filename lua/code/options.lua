--
--  HACK: Options
--

-----------------------------------------------------------
--  INFO: Config
-----------------------------------------------------------
local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
--  INFO: Set leader key
-----------------------------------------------------------
g.mapleader = " "
g.maplocalleader = " "

-----------------------------------------------------------
--  INFO: General
-----------------------------------------------------------
opt.mouse = "a"                               -- Enable mouse support
opt.clipboard = "unnamedplus"                 -- Copy/paste to system clipboard
opt.swapfile = false                          -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

-----------------------------------------------------------
--  INFO: Memory, CPU
-----------------------------------------------------------
opt.hidden = true    -- Enable background buffers
opt.history = 100    -- Remember N lines in history
opt.synmaxcol = 240  -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
--  INFO: Save undo data
-----------------------------------------------------------
opt.undofile = true

-----------------------------------------------------------
--  INFO: Scrolling
-----------------------------------------------------------
opt.scrolloff = 4 -- Lines of context
opt.expandtab = true
