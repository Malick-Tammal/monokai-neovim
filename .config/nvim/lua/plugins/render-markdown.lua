return {
	"MeanderingProgrammer/render-markdown.nvim",
	event = { "BufReadPre", "BufNewFile" },
	ft = { "markdown", "Avante" },

	opts = {
		file_types = { "markdown", "Avante" },
		checkbox = {
			enabled = true,
			right_pad = 1,

			checked = {
				icon = " ",
			},
			unchecked = {
				icon = "󰄱 ",
			},
			indeterminate = {
				icon = " ",
			},

			custom = {
				todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
			},
		},
		code = {
			sign = false,
			left_pad = 3,
			right_pad = 3,
			language_border = " ",
			language_left = "",
			language_right = "",
			border = "thick",
			winblend = 0,
			width = "block",
		},
	},
}
