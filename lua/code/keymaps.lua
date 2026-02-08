local keymap = vim.keymap.set
local vscode = require("vscode-neovim")

-- Helper: Call VS Code commands efficiently
local function action(cmd)
	return function()
		vscode.call(cmd)
	end
end

keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-----------------------------------------------------------
--  INFO: Navigation
-----------------------------------------------------------

-- 1. Window Movement (Ctrl + h/j/k/l)
keymap({ "n", "x" }, "<C-h>", action("workbench.action.navigateLeft"), opts)
keymap({ "n", "x" }, "<C-j>", action("workbench.action.navigateDown"), opts)
keymap({ "n", "x" }, "<C-k>", action("workbench.action.navigateUp"), opts)
keymap({ "n", "x" }, "<C-l>", action("workbench.action.navigateRight"), opts)

-- 2. Window Management
keymap("n", "<leader>q", action("workbench.action.closeActiveEditor"), opts) -- Close buffer
keymap("n", "<leader>o", action("workbench.action.closeOtherEditors"), opts) -- Close others

-----------------------------------------------------------
--  INFO: FILE & EDITOR ACTIONS
-----------------------------------------------------------

-- 1. Sidebar Toggles
keymap("n", "<leader>e", action("workbench.action.toggleSidebarVisibility")) -- File Explorer
keymap("n", "<leader>a", action("workbench.action.toggleAuxiliaryBar")) -- AI Agent / Outline

-- 2. Finding Files (Telescope Replacement)
keymap("n", "<leader><leader>", action("workbench.action.quickOpen")) -- Ctrl+P (Find File)
keymap("n", "<leader>fw", action("workbench.action.findInFiles")) -- Grep (Find in Project)
keymap("n", "<leader>fd", action("workbench.action.showAllSymbols")) -- Find Symbol

-- 3. Code Actions (LSP)
keymap("n", "gd", action("editor.action.revealDefinition")) -- Go to Definition
keymap("n", "gr", action("editor.action.goToReferences")) -- Go to References
keymap("n", "<leader>r", action("editor.action.rename")) -- Rename Symbol
keymap("n", "K", action("editor.action.showHover")) -- Hover Documentation

-----------------------------------------------------------
--  INFO: Utility
-----------------------------------------------------------

-- Format Document (Prettier/LSP)
keymap("n", "<leader>fm", action("editor.action.formatDocument"))

-- Toggle Terminal Panel
keymap("n", "<leader>t", action("workbench.action.togglePanel"))

-- Restart Neovim backend to apply config changes
keymap("n", "<leader>R", action("vscode-neovim.restart"))

-- Treesj Toggle
vim.keymap.set("n", "<leader>w", function()
	local status, treesj = pcall(require, "treesj")
	if status then
		treesj.toggle()
	else
		vim.cmd("normal! J")
	end
end, { desc = "Surgical Split/Join" })
