return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				-- INFO: Web
				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettier" },

				-- INFO: Config
				lua = { "stylua" },
				toml = { "taplo" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "beautysh" },
				jsonc = { "prettier" },

				-- INFO: Other
				rust = { "rustfmt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				async = false,
			},

			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
