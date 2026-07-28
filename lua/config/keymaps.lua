-----------------------------------------------------------
--  HACK: Keymaps
-----------------------------------------------------------

local map = vim.keymap

-- Disable the spacebar key's default behavior in Normal and Visual modes
map.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--  INFO: Code (file) actions
-----------------------------------------------------------
local function smart_save()
	if vim.g.disable_autoformat then
		vim.cmd("noautocmd w")
	else
		vim.cmd("w")
	end
end

map.set("n", "<leader>cs", smart_save, opts) -- Save current file
map.set("n", "<C-s>", smart_save, opts) -- Save current file

map.set("n", "<leader>cn", function()
	vim.cmd("noautocmd w") -- Save without format
end, opts)

-----------------------------------------------------------
--  INFO: Find and center
-----------------------------------------------------------
map.set("n", "n", "nzzzv", opts) -- Go next search item
map.set("n", "N", "Nzzzv", opts) -- Go previous search item

-----------------------------------------------------------
--  INFO: Resize with arrows
-----------------------------------------------------------
map.set("n", "<Up>", ":resize -2<CR>", opts) -- Horizontal shrink
map.set("n", "<Down>", ":resize +2<CR>", opts) -- Horizntal expand
map.set("n", "<Left>", ":vertical resize -2<CR>", opts) -- Vertical shrink
map.set("n", "<Right>", ":vertical resize +2<CR>", opts) -- Vertical expand

-----------------------------------------------------------
--  INFO: Buffers
-----------------------------------------------------------
map.set("n", "<Tab>", ":bnext<CR>", opts) -- Next buffer
map.set("n", "<S-Tab>", ":bprevious<CR>", opts) -- Previous buffer
map.set("n", "<A-l>", ":bnext<CR>", opts) -- Next buffer
map.set("n", "<A-h>", ":bprevious<CR>", opts) -- Previous buffer
map.set("n", "<A-q>", ":lua MiniBufremove.delete()<CR>", opts) -- Kill buffer
map.set("n", "<A-n>", "<cmd> enew <CR>", opts) -- New buffer

-----------------------------------------------------------
--  INFO: Split
-----------------------------------------------------------
map.set("n", "<leader>sv", "<C-w>v", opts) -- Split window vertically
map.set("n", "<leader>sh", "<C-w>s", opts) -- Split window horizontally
map.set("n", "<leader>se", "<C-w>=", opts) -- Make split windows equal width & height
map.set("n", "<leader>sx", ":close<CR>", opts) -- Close current split window

-----------------------------------------------------------
--  INFO: Tabs
-----------------------------------------------------------
map.set("n", "<leader>Tn", ":tabnew<CR>", opts) -- Open new tab
map.set("n", "<leader>Tx", ":tabclose<CR>", opts) -- Close current tab
map.set("n", "<leader>TN", ":tabn<CR>", opts) -- Next tab
map.set("n", "<leader>Tp", ":tabp<CR>", opts) -- Previous tab

-----------------------------------------------------------
--  INFO: Indent lines
-----------------------------------------------------------
map.set("v", "<", "<gv", opts) -- Indent line to the left
map.set("v", ">", ">gv", opts) -- Indent line to the right

-----------------------------------------------------------
--  INFO: Actions
-----------------------------------------------------------
map.set("v", "p", '"_dP', opts) -- Keep last yanked when pasting

-----------------------------------------------------------
--  INFO: Diagnostic
-----------------------------------------------------------
map.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" }) -- Previous Diagnostic
map.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" }) -- Next Diagnostic
map.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" }) -- Floating Diagnostic
map.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" }) -- Diagnostic list

-----------------------------------------------------------
--  INFO: Clear search highlight
-----------------------------------------------------------
map.set("n", "<C-c>", "<Cmd>noh<CR>", opts) -- Clear search

-----------------------------------------------------------
--  INFO: Quit
-----------------------------------------------------------
map.set("n", "<leader>qq", "<Cmd>qa<CR>") -- Quit without saving!
map.set("n", "<leader>qw", "<Cmd>xa<CR>") -- Quit and save
map.set("n", "<C-q>", "<cmd> q <CR>", opts) -- Quit current

-----------------------------------------------------------
--  INFO: Lazy
-----------------------------------------------------------
map.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- Call Lazy

-----------------------------------------------------------
--  INFO: Deleting
-----------------------------------------------------------
map.set({ "n", "v" }, "<leader>x", '"_d') -- Delete without copy it
map.set("n", "x", '"_x', opts) -- Delete single character without copying into register

-----------------------------------------------------------
--  INFO: Projects
-----------------------------------------------------------
local projects = require("plugins.custom.projects")

map.set("n", "<leader>p", function() -- Open projects list
	projects.setup()
end, { desc = "Projects" })

-----------------------------------------------------------
--  INFO: Comment Header
-----------------------------------------------------------
map.set("n", "<leader>C", "<Cmd>Inscom<CR>", { desc = "Header 1" })

-----------------------------------------------------------
--  INFO: Renamer
-----------------------------------------------------------
map.set("n", "<leader>r", vim.lsp.buf.rename) -- Rename variable

-----------------------------------------------------------
--  INFO: Exit "insert" mode
-----------------------------------------------------------
map.set("i", "jj", "<Esc>", { noremap = false }) -- Exit insert mode
map.set("i", "JJ", "<Esc>", { noremap = false }) -- Exit insert mode

-----------------------------------------------------------
--  INFO: Navigation in insert mode
-----------------------------------------------------------
map.set("i", "<C-h>", "<Left>", { noremap = true, silent = true }) -- Left
map.set("i", "<C-j>", "<Down>", { noremap = true, silent = true }) -- Down
map.set("i", "<C-k>", "<Up>", { noremap = true, silent = true }) -- Up
map.set("i", "<C-l>", "<Right>", { noremap = true, silent = true }) -- Right

-----------------------------------------------------------
--  INFO: Color picker "Palettes"
-----------------------------------------------------------
map.set("n", "<leader>Ps", ":Shades<CR>") -- Color palettes 1
map.set("n", "<leader>Ph", ":Huefy<CR>") -- Color palettes 2

-----------------------------------------------------------
--  INFO: Snacks
-----------------------------------------------------------
map.set("n", "<leader>Gl", function() -- Toggle LazyGit
	Snacks.lazygit()
end)

map.set("n", "<leader>z", function() -- Toggle zen mode
	Snacks.zen()
end)

map.set("n", "<leader>cd", function() -- Enable dim
	Snacks.dim()
end)

map.set("n", "<leader>cD", function() -- Disable dim
	Snacks.dim.disable()
end)
-----------------------------------------------------------
--  INFO: Formatting
-----------------------------------------------------------
vim.g.disable_autoformat = false

map.set("n", "<leader>tf", function() -- Toggle autoformat
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	local status = vim.g.disable_autoformat and "OFF" or "ON"
	print("Auto-Format " .. status)
end, { desc = "Toggle Auto-Format" })

local function message(msg, icon)
	local file = vim.fn.expand("%:t")
	return icon .. file .. msg
end

map.set({ "n" }, "<leader>cf", function() -- Format file
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
	vim.notify(message(" File Formatted", ""), "", {
		title = "Monokai-Nvim",
	})
end)
