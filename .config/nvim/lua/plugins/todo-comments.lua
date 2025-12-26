return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },

	-- NOTE: Options
	opts = {
		keywords = {
			-- tests to show them

			-- INFO:
			-- TIP:
			-- FIX:
			-- HACK:
			-- PERF:
			-- NOTE:
			-- TODO:
			-- WARN:
			-- TEST:

			INFO = { icon = " ", color = "info" },
			TIP = { icon = " ", color = "tip" },
			FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			HACK = { icon = " ", color = "warning" },
			PERF = { icon = "󰓅 ", color = "pref", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = {} },
			TODO = { icon = " ", color = "info" },
			TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		},

		highlight = {
			multiline = false,
		},

		colors = {
			tip = { "Function" },
			info = { "MoreMsg" },
			pref = { "Character" },
			test = { "Directory" }

		},
	},
}
