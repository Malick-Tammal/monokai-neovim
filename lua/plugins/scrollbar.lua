return {
	"petertriho/nvim-scrollbar",
	cond = not vim.g.vscode,
	event = "VeryLazy",

	config = function()
		require("scrollbar").setup({
			handle = {
				text = " ",
				blend = 0,
				color = nil,
				color_nr = nil,
				highlight = "FloatTitle",
				hide_if_all_visible = false,
			},
			marks = {
				Cursor = {
					highlight = "CursorIndicator",
				},
			},
			excluded_buftypes = {
				"terminal",
			},
			excluded_filetypes = {
				"notify",
				"blink-cmp-menu",
				"dropbar_menu",
				"dropbar_menu_fzf",
				"DressingInput",
				"cmp_docs",
				"cmp_menu",
				"noice",
				"prompt",
				"TelescopePrompt",
				"neo-tree",
			},
		})
	end,
}
