return {
	"nvim-treesitter/nvim-treesitter",

	-- Load the plugin when a relevant buffer is read or a new file is created
	event = { "BufReadPre", "BufNewFile" },

	-- Ensure the parsers are built/updated after the plugin is installed
	build = ":TSUpdate",

	-- Configuration function runs ONLY after the plugin is successfully loaded
	config = function()
		local configs = require("nvim-treesitter")

		configs.setup({
			-- 1. Parser Installation Settings
			ensure_installed = { -- This must be a Lua table {}
				"lua",
				"python",
				"javascript",
				"typescript",
				"vimdoc",
				"vim",
				"toml",
				"json",
				"yaml",
				"markdown",
				"markdown_inline",
				"bash",
				"tsx",
				"css",
				"scss",
				"html",
				"regex",
			},

			-- These settings match your original configuration:
			sync_install = false,
			auto_install = true,

			-- 2. Module Activation (Highlighting)
			highlight = {
				enable = true,
				-- We recommend keeping this false for performance/accuracy
				additional_vim_regex_highlighting = false,
			},

			-- 3. Module Activation (Indentation)
			indent = {
				enable = true,
				disable = { "ruby" }, -- Matches your original setting
			},

			-- 4. Context/Scope (Recommended Modern Features - Uncomment to enable)
			-- context_commentstring = { enable = true, },
			-- textobjects = { enable = true, },
		})

		-- Custom filetype addition (copied from your old config)
		vim.filetype.add({
			pattern = { ["config"] = "config" },
		})
	end,
}
