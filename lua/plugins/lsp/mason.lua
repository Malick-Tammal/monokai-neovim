return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},

	--  INFO: Keymaps
	keys = {
		{ "<leader>m", "<Cmd>Mason<CR>", desc = "Mason" }, -- Call Mason
	},

	--  INFO: Options
	config = function()
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		--  TIP: UI
		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		--  TIP: LSPs
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"cssls",
				"emmet_ls",
				"jsonls",
				"html",
				"rust_analyzer",
				"tailwindcss",
				"bashls",
				"hyprls",
				"qmlls",
				"pyright",
			},
			automatic_installation = true,
		})

		--  TIP: Formatters
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"prettierd",
				"stylua",
				"shfmt",
				"beautysh",
				"taplo",
				"ruff",
			},
			run_on_start = true,
			start_delay = 1000,
		})

		--  TIP: Check if all formatters are installed if not install them
		vim.defer_fn(function()
			require("mason-tool-installer").check_install(false)
		end, 1000)
	end,
}
