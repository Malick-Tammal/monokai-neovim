--
--  HACK: Options
--

-----------------------------------------------------------
--  INFO: Config
-----------------------------------------------------------
local g = vim.g     -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local o = vim.o

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
--  INFO: Neovim UI
-----------------------------------------------------------
opt.number = true         -- Show line number
opt.relativenumber = true -- Set relative numbered lines
opt.showmatch = true      -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = "10" -- Line lenght marker at 80 columns
opt.splitright = true     -- Vertical split to the right
opt.splitbelow = true     -- Horizontal split to the bottom
opt.ignorecase = true     -- Ignore case letters when search
opt.smartcase = true      -- Ignore lowercase for the whole pattern
opt.linebreak = true      -- Wrap on word boundary
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.laststatus = 3        -- Set global statusline
vim.opt.cursorline = true -- Highlight current line
vim.opt.cursorlineopt = "both"

-----------------------------------------------------------
--  INFO: Tabs, indent
-----------------------------------------------------------
-- opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4     -- Shift 4 spaces when tab
opt.tabstop = 4        -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines
opt.signcolumn = "yes:1"

-----------------------------------------------------------
--  INFO: Memory, CPU
-----------------------------------------------------------
opt.hidden = true    -- Enable background buffers
opt.history = 100    -- Remember N lines in history
opt.synmaxcol = 240  -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event
-- opt.lazyredraw = true -- Faster scrolling

-----------------------------------------------------------
--  INFO: Snacks picker
-----------------------------------------------------------
g.lazyvim_picker = "snacks"
opt.confirm = true

-----------------------------------------------------------
--  INFO: Folding code block
-----------------------------------------------------------
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""
opt.fillchars:append({ fold = " " })
opt.conceallevel = 1

-----------------------------------------------------------
--  INFO: Save undo data
-----------------------------------------------------------
opt.undofile = true

-----------------------------------------------------------
--  INFO: Scrolling
-----------------------------------------------------------
opt.scrolloff = 4 -- Lines of context

opt.expandtab = true
