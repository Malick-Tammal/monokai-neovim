--
--  HACK: Keymaps
--

local map = vim.keymap -- Keymaps

-- Disable the spacebar key's default behavior in Normal and Visual modes
map.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--  INFO: Code (file) actions
-----------------------------------------------------------
local function message(msg, icon)
    local file = vim.fn.expand("%:t")
    return icon .. file .. msg
end

map.set("n", "<leader>cs", function()
    vim.cmd("w") -- Save
end, opts)

map.set("n", "<C-s>", function()
    vim.cmd("w") -- Save 2
end, opts)

map.set("n", "<leader>cn", function()
    vim.cmd("noautocmd w") -- Save without format
end, opts)

map.set({ "n" }, "<leader>cf", function()
    require("conform").format({
        lsp_fallback = true,
        async = true,
        timeout_ms = 500,
    })
    vim.notify(message(" Formatted!", " 󰆓 "), "", {
        title = "VIM",
    })
end)

-----------------------------------------------------------
--  INFO: Find and center
-----------------------------------------------------------
map.set("n", "n", "nzzzv", opts)
map.set("n", "N", "Nzzzv", opts)

-----------------------------------------------------------
--  INFO: Resize with arrows
-----------------------------------------------------------
map.set("n", "<Up>", ":resize -2<CR>", opts)
map.set("n", "<Down>", ":resize +2<CR>", opts)
map.set("n", "<Left>", ":vertical resize -2<CR>", opts)
map.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-----------------------------------------------------------
--  INFO: Buffers
-----------------------------------------------------------
map.set("n", "<Tab>", ":bnext<CR>", opts)
map.set("n", "<S-Tab>", ":bprevious<CR>", opts)
map.set("n", "<leader>bx", ":lua MiniBufremove.delete()<CR>", opts) -- close buffer
map.set("n", "<leader>bb", "<cmd> enew <CR>", opts)                 -- new buffer

-----------------------------------------------------------
--  INFO: Split
-----------------------------------------------------------
map.set("n", "<leader>sv", "<C-w>v", opts)     -- split window vertically
map.set("n", "<leader>sh", "<C-w>s", opts)     -- split window horizontally
map.set("n", "<leader>se", "<C-w>=", opts)     -- make split windows equal width & height
map.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-----------------------------------------------------------
--  INFO: Navigate between splits
-----------------------------------------------------------
-- map.set("n", "<C-K>", ":wincmd k<CR>", opts)
-- map.set("n", "<C-J>", ":wincmd j<CR>", opts)
-- map.set("n", "<C-H>", ":wincmd h<CR>", opts)
-- map.set("n", "<C-L>", ":wincmd l<CR>", opts)

-----------------------------------------------------------
--  INFO: Tabs
-----------------------------------------------------------
map.set("n", "<leader>To", ":tabnew<CR>", opts)   -- open new tab
map.set("n", "<leader>Tx", ":tabclose<CR>", opts) -- close current tab
map.set("n", "<leader>Tn", ":tabn<CR>", opts)     --  go to next tab
map.set("n", "<leader>Tp", ":tabp<CR>", opts)     --  go to previous tab

-----------------------------------------------------------
--  INFO: Indent lines
-----------------------------------------------------------
map.set("v", "<", "<gv", opts)
map.set("v", ">", ">gv", opts)

-----------------------------------------------------------
--  INFO: Actions
-----------------------------------------------------------
map.set("v", "p", '"_dP', opts) -- Keep last yanked when pasting

-----------------------------------------------------------
--  INFO: Diagnostic
-----------------------------------------------------------
map.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })                   -- Previous Diagnostic
map.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })                       -- Next Diagnostic
map.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })                   -- Floating Diagnostic
map.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })                              -- Diagnostic list
map.set("n", "<leader>td", "<Cmd>lua require('tiny-inline-diagnostic').toggle()<CR>", { desc = "Toggle diagnostics" }) -- Toggle diagnostic

-----------------------------------------------------------
--  INFO: Neotree
-----------------------------------------------------------
map.set("n", "<leader>n", "<Cmd>Neotree toggle<CR>", { desc = "Explorer Neotree (Toggle)" }) -- Toggle Neotree
map.set("n", "<leader>e", function()
    local MiniFiles = require("mini.files")
    if not MiniFiles.close() then
        MiniFiles.open()
    end
end) -- Toggle mini files

-- Search
map.set("n", "<C-c>", "<Cmd>noh<CR>", opts)

-----------------------------------------------------------
--  INFO: Telescope
-----------------------------------------------------------
local builtin = require("telescope.builtin")
map.set("n", "<leader><space>", builtin.find_files) -- Telescope find files
map.set("n", "<leader>G", builtin.live_grep)        -- Telescope live grep
map.set("n", "<leader>bf", builtin.buffers)         -- Telescope buffers
map.set("n", "<leader>h", builtin.help_tags)        -- Telescope help tags

-----------------------------------------------------------
--  INFO: Quit
-----------------------------------------------------------
map.set("n", "<leader>qq", "<Cmd>qa<CR>")   -- Quit without saving!
map.set("n", "<leader>qw", "<Cmd>xa<CR>")   -- Quit and save
map.set("n", "<C-q>", "<cmd> q <CR>", opts) -- Quit current

-----------------------------------------------------------
--  INFO: Lazy
-----------------------------------------------------------
map.set("n", "<leader>l", "<Cmd>Lazy<CR>", { desc = "Lazy" }) -- Call Lazy

-----------------------------------------------------------
--  INFO: Mason
-----------------------------------------------------------
map.set("n", "<leader>m", "<Cmd>Mason<CR>") -- Call Mason

-----------------------------------------------------------
--  INFO: Deleting
-----------------------------------------------------------
map.set({ "n", "v" }, "<leader>x", '"_d') -- "Delete without copy it"
map.set("n", "x", '"_x', opts)            -- Delete single character without copying into register

-----------------------------------------------------------
--  INFO: TODO Comments
-----------------------------------------------------------
map.set("n", "]t", function()
    require("todo-comments").jump_next() -- Next todo comment
end, { desc = "Next todo comment" })

map.set("n", "[t", function()
    require("todo-comments").jump_prev() -- Previous todo comment
end, { desc = "Previous todo comment" })

-----------------------------------------------------------
--  INFO: Projects
-----------------------------------------------------------
local projects = require("plugins.custom.projects")

map.set("n", "<leader>p", function()
    projects.setup() -- Open projects folder
end, { desc = "Projects" })

-----------------------------------------------------------
--  INFO: Lorem Ipsum
-----------------------------------------------------------
map.set("n", "<leader>Lw", function()
    vim.cmd("LoremIpsum words " .. vim.fn.input("Number of words")) -- Words
end, { desc = "Words" })

map.set("n", "<leader>Lp", function()
    vim.cmd("LoremIpsum paragraphs " .. vim.fn.input("Number of paragraphs")) -- Paragraphs
end, { desc = "Paragraphs" })

-----------------------------------------------------------
--  INFO: Comment Header
-----------------------------------------------------------
local inscom = require("plugins.custom.inscom")

map.set("n", "<leader>C1", function()
    inscom.setup({
        style = "style-1", -- style 1
    })
end, { desc = "Header 1" })

map.set("n", "<leader>C2", function()
    inscom.setup({
        style = "style-2", -- style 2
    })
end, { desc = "Header 2" })

map.set("n", "<leader>C3", function()
    inscom.setup({
        style = "style-3", -- style 3
    })
end, { desc = "Header 3" })

-----------------------------------------------------------
--  INFO: Renamer
-----------------------------------------------------------
map.set("n", "<leader>r", vim.lsp.buf.rename)

-----------------------------------------------------------
--  INFO: Yanky
-----------------------------------------------------------
map.set("n", "<leader>y", ":YankyRingHistory<CR>")

-----------------------------------------------------------
--  INFO: Exit "insert" mode
-----------------------------------------------------------
map.set("i", "jj", "<Esc>", { noremap = false })
map.set("i", "JJ", "<Esc>", { noremap = false })

-----------------------------------------------------------
--  INFO: Live server
-----------------------------------------------------------
map.set("n", "<leader>S", ":LiveServerToggle<CR>")

-----------------------------------------------------------
--  INFO: Copilot
-----------------------------------------------------------
map.set("i", "<S-Tab>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map.set("n", "<leader>Oe", ":Copilot enable<CR>", { desc = "Enable" })
map.set("n", "<leader>Od", ":Copilot disable<CR>", { desc = "Disable" })

-----------------------------------------------------------
--  INFO: Render Markdown
-----------------------------------------------------------
map.set("n", "<leader>M", ":RenderMarkdown toggle<CR>")

-----------------------------------------------------------
--  INFO: Obsidian
-----------------------------------------------------------
map.set("n", "<leader>Nf", ":ObsidianFollowLink<CR>")
map.set("n", "<leader>Nl", ":ObsidianLinks<CR>")
map.set("n", "<leader>Nt", ":ObsidianTags<CR>")
map.set("n", "<leader>Nb", ":ObsidianBacklinks<CR>")
map.set("n", "<leader>Nc", ":ObsidianCheck<CR>")
map.set("n", "<leader>No", ":ObsidianOpen<CR>")
map.set("n", "<leader>Nr", ":ObsidianRename<CR>")
map.set("n", "<leader>Ng", ":ObsidianSearch<CR>")
map.set("n", "<leader>NT", ":ObsidianTOC<CR>")
map.set("n", "<leader>Nw", ":ObsidianWorkspace<CR>")

-----------------------------------------------------------
--  INFO: Navigation in insert mode
-----------------------------------------------------------
map.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
map.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
map.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
map.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-----------------------------------------------------------
--  INFO: Color picker "Palettes"
-----------------------------------------------------------
map.set("n", "<leader>Ps", ":Shades<CR>")
map.set("n", "<leader>Ph", ":Huefy<CR>")

-----------------------------------------------------------
--  INFO: Clear notifications
-----------------------------------------------------------
map.set("n", "<leader>`", function()
    require("notify").dismiss()
end, { desc = "Clear notifications" })

-----------------------------------------------------------
--  INFO: Toggle color highlights
-----------------------------------------------------------
-- local highlight_colors = require("nvim-highlight-colors")
--
-- -- Create a custom toggle function
-- local function toggle_colors()
--     highlight_colors.toggle()
-- end
--
-- -- Map it to a keybind (e.g., <leader>tc for "Toggle Colors")
-- vim.keymap.set('n', '<leader>tc', toggle_colors, { desc = 'Toggle Color Highlights' })
