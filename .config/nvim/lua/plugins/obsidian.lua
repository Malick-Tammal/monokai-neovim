return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
	enabled = false,

	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Data/Web_dev/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Data/Web_dev/*.md",
	},

	opts = {
		workspaces = {
			{
				name = "development",
				path = "~/Data/development/",
			},
			-- For more vaults
			-- {
			-- 	name = "work",
			-- 	path = "~/vaults/work",
			-- },
		},

		ui = {
			enable = true,
			checkboxes = {},
		},
	},
}
