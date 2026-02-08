return {
	"epwalsh/obsidian.nvim",
	cond = not vim.g.vscode,
	version = "*",
	ft = "markdown",
	enabled = true,

	keys = {
		{ "<leader>Nf", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
		{ "<leader>Nl", "<cmd>ObsidianLinks<CR>", desc = "List Links" },
		{ "<leader>Nt", "<cmd>ObsidianTags<CR>", desc = "List Tags" },
		{ "<leader>Nb", "<cmd>ObsidianBacklinks<CR>", desc = "Show Backlinks" },
		{ "<leader>Nc", "<cmd>ObsidianCheck<CR>", desc = "Check Issues" },
		{ "<leader>No", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian App" },
		{ "<leader>Nr", "<cmd>ObsidianRename<CR>", desc = "Rename Note" },
		{ "<leader>Ng", "<cmd>ObsidianSearch<CR>", desc = "Search Notes" },
		{ "<leader>NT", "<cmd>ObsidianTOC<CR>", desc = "Table of Contents" },
		{ "<leader>Nw", "<cmd>ObsidianWorkspace<CR>", desc = "Switch Workspace" },
	},

	opts = {
		workspaces = {
			{
				name = "development",
				path = "~/Data/development/",
			},
		},

		ui = {
			enable = true,
			checkboxes = {},
		},
	},
}
