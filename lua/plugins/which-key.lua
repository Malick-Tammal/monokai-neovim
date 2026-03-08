return {
	"folke/which-key.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",

	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = true, loop = true })
			end,
			desc = "Which-key 'I know you forget'",
		},
	},

	--
	--  HACK: Config ("ALL KEYS")
	--
	config = function()
		local wk = require("which-key")
		wk.add({
			-- Which Key (All info)
			{ "<leader>?", group = "Which Key?", icon = { icon = "󰌏 ", color = "blue" } },

			-- Toggles
			{ "<leader>t", group = "Toggles", icon = { icon = "", color = "yellow" } },

			-- Neotree
			{ "<leader>n", group = "Neotree", icon = { icon = "󰲂 ", color = "yellow" } },

			-- Delete
			{ "<leader>x", group = "Delete (Black Hole)", icon = { icon = "󰗨", color = "red" } },

			-- Split
			{ "<leader>s", group = "Split", icon = { icon = "󰯌 ", color = "blue" } },
			{ "<leader>sh", desc = "Horizontally", icon = { icon = " ", color = "yellow" } },
			{ "<leader>sv", desc = "Vertically", icon = { icon = " ", color = "yellow" } },
			{ "<leader>se", desc = "50/50", icon = { icon = " ", color = "yellow" } },
			{ "<leader>sx", desc = "Close", icon = { icon = " ", color = "yellow" } },

			-- Mason
			{ "<leader>m", group = "Mason", icon = { icon = "󰉡 ", color = "orange" } },

			-- Quit
			{ "<leader>q", group = "Quit", icon = { icon = "󰩈 ", color = "red" } },
			{ "<leader>qq", desc = "Quit without saving!", icon = { icon = "󰽂 ", color = "yellow" } },
			{ "<leader>qw", desc = "Quit and save!", icon = { icon = "󰆓 ", color = "yellow" } },

			-- Buffers
			{ "<leader>b", group = "Buffers", icon = { icon = " ", color = "blue" } },
			{ "<leader>bn", desc = "New", icon = { icon = " ", color = "yellow" } },
			{ "<leader>k", desc = "Kill buffer", icon = { icon = " ", color = "yellow" } },
			{ "<leader>bf", desc = "Find", icon = { icon = " ", color = "yellow" } },

			-- Telescope
			{ "<leader>h", desc = "Help tags", icon = { icon = "󰞋 ", color = "green" } },
			{ "<leader>g", desc = "Grep", icon = { icon = "󰈞 ", color = "cyan" } },

			-- Tabs
			{ "<leader>T", desc = "Tabs", icon = { icon = "󱃢 ", color = "purple" } },
			{ "<leader>Tn", desc = "Next", icon = { icon = "󰙡 ", color = "yellow" } },
			{ "<leader>To", desc = "New", icon = { icon = " ", color = "yellow" } },
			{ "<leader>Tp", desc = "Previous", icon = { icon = "󰙣 ", color = "yellow" } },
			{ "<leader>Tx", desc = "Close", icon = { icon = "󰅙 ", color = "yellow" } },

			-- Diagnostics
			{ "<leader>d", desc = "Diagnostics", icon = { icon = " ", color = "green" } },
			{ "<leader>td", desc = "Toggle Diagnostics", icon = { icon = " ", color = "orange" } },

			-- Code
			{ "<leader>c", desc = "Code (File)", icon = { icon = " ", color = "orange" } },
			{ "<leader>cs", desc = "Save", icon = { icon = "󰆓 ", color = "yellow" } },
			{ "<leader>cn", desc = "Save without format", icon = { icon = "󰽂 ", color = "yellow" } },
			{ "<leader>cf", desc = "Format", icon = { icon = " ", color = "yellow" } },
			{ "<leader>tf", desc = "Toggle Format", icon = { icon = " ", color = "yellow" } },
			-- Dimming
			{ "<leader>cd", desc = "Dim", icon = { icon = "󱜟 ", color = "yellow" } },
			{ "<leader>cD", desc = "UnDim", icon = { icon = "󰞏 ", color = "yellow" } },

			-- Telescope
			{ "<leader><space>", desc = "Telescope", icon = { icon = " ", color = "orange" } },

			-- Zen mode
			{ "<leader>z", desc = "Zen mode", icon = { icon = " ", color = "cyan" } },

			-- Git
			{ "<leader>G", desc = "Git", icon = { icon = " ", color = "cyan" } },
			{ "<leader>Gs", desc = "Stage hunk", icon = { icon = " ", color = "yellow" } },
			{ "<leader>GS", desc = "Stage buffer", icon = { icon = " ", color = "yellow" } },
			{ "<leader>Gr", desc = "Reset hunk", icon = { icon = "󰑓 ", color = "yellow" } },
			{ "<leader>GR", desc = "Reset buffer", icon = { icon = "󰑓 ", color = "yellow" } },
			{ "<leader>Gd", desc = "Diff this", icon = { icon = " ", color = "yellow" } },
			{ "<leader>Gb", desc = "Blame line", icon = { icon = " ", color = "yellow" } },
			{ "<leader>Gw", desc = "Word diff", icon = { icon = " ", color = "yellow" } },
			{ "<leader>Gm", desc = "Line blame", icon = { icon = "󰘤 ", color = "yellow" } },
			{ "<leader>Gi", desc = "Preview Hunk", icon = { icon = "󰮳 ", color = "yellow" } },
			{ "<leader>Gp", desc = "Preview Hunk (popup)", icon = { icon = "󰮳 ", color = "yellow" } },
			{ "<leader>Gq", desc = "Quick fix list", icon = { icon = "󰁨 ", color = "yellow" } },
			-- Lazygit
			{ "<leader>Gl", desc = "Lazygit", icon = { icon = "󰒲 ", color = "yellow" } },

			-- Lorem ipsum
			{ "<leader>L", desc = "LoremIpsum", icon = { icon = "󰬓 ", color = "azure" } },
			{ "<leader>Lw", desc = "Words", icon = { icon = "󰬞 ", color = "orange" } },
			{ "<leader>Lp", desc = "Paragraphs", icon = { icon = "󰬗 ", color = "orange" } },

			-- Projects
			{ "<leader>p", desc = "Projects", icon = { icon = "󰅨 ", color = "orange" } },

			-- Treesj (Split / Join)
			{ "<leader>w", desc = "(Split / Join)", icon = { icon = " ", color = "yellow" } },

			-- Comments
			{ "<leader>C", desc = "Comments", icon = { icon = "󱀡 ", color = "yellow" } },
			-- Headers
			{ "<leader>C1", desc = "Header 1", icon = { icon = "󰉳 ", color = "orange" } },
			{ "<leader>C2", desc = "Header 2", icon = { icon = "󰉳 ", color = "orange" } },
			{ "<leader>C3", desc = "Header 3", icon = { icon = "󰉳 ", color = "orange" } },

			-- Renamer
			{ "<leader>r", desc = "Renamer", icon = { icon = "󰑕 ", color = "cyan" } },

			-- Yanky (Yank history)
			{ "<leader>y", desc = "Yank history", icon = { icon = " ", color = "purple" } },

			-- Live server
			{ "<leader>ts", desc = "Toggle Live Server", icon = { icon = " ", color = "green" } },

			-- Copilot
			{ "<leader>tC", desc = "Toggle Copilot", icon = { icon = " ", color = "cyan" } },

			-- Avante
			{ "<leader>a", desc = "Avante (AI)", icon = { icon = "󰚩 ", color = "red" } },

			-- Render Markdown
			{ "<leader>tM", desc = "Toggle Render Markdown", icon = { icon = " ", color = "cyan" } },

			-- Obsidian
			{ "<leader>N", desc = "Obsidian", icon = { icon = " ", color = "green" } },
			{ "<leader>Nl", desc = "Links", icon = { icon = " ", color = "green" } },
			{ "<leader>Nf", desc = "Follow link", icon = { icon = "󰪹 ", color = "green" } },
			{ "<leader>Nt", desc = "Tags", icon = { icon = " ", color = "green" } },
			{ "<leader>Nb", desc = "Backlinks", icon = { icon = "󰌷 ", color = "green" } },
			{ "<leader>Nc", desc = "Check", icon = { icon = " ", color = "green" } },
			{ "<leader>No", desc = "Open", icon = { icon = " ", color = "green" } },
			{ "<leader>Nr", desc = "Rename", icon = { icon = "󰑕 ", color = "green" } },
			{ "<leader>Ng", desc = "Grep", icon = { icon = "󰈞 ", color = "green" } },
			{ "<leader>NT", desc = "Titles", icon = { icon = "󰕱 ", color = "green" } },
			{ "<leader>Nw", desc = "Workspaces", icon = { icon = "󰂻 ", color = "green" } },

			-- Color highlight
			{ "<leader>tc", desc = "Toggle Color Highlights", icon = { icon = "󰌁", color = "orange" } },

			-- Mini files
			{ "<leader>e", desc = "Mini files", icon = { icon = "󰲂", color = "yellow" } },

			-- Nvim toggler
			{ "<leader>tw", desc = "Toggle word", icon = { icon = "", color = "green" } },

			-- Pickers
			{ "<leader>P", desc = "Pickers", icon = { icon = "󰉦", color = "purple" } },

			-- Treesj
			{ "<leader>w", desc = "(Split / Join)", icon = { icon = "", color = "yellow" } },

			-- Supermaven
			{ "<leader>tS", desc = "Toggle Supermaven (AI)", icon = { icon = "󰚩", color = "orange" } },
		})

		wk.setup({
			preset = "classic", --  TIP: classic - modern - helix
			icons = {
				-- group = "   ",
				group = "  ",
			},
		})
	end,
}
