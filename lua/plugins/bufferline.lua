return {
	"akinsho/bufferline.nvim",
	cond = not vim.g.vscode,
	version = "*",
	event = "VeryLazy",
	enabled = true,

	dependencies = {
		"Mirsmog/real-icons.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	-- HACK:
	opts = {
		options = {
			mode = "buffers",

			-- INFO: Explorer
			offsets = {
				{
					filetype = "neo-tree",
					text = function()
						local title = "󰲂 Explorer | "
						local path = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						return title .. '"' .. path .. '"'
					end,
					separator = true,
					text_align = "center",
					highlight = "BufferLineNeoTree",
				},
			},
			themable = true,
			indicator = {
				icon = "  ",
				style = "icon",
			},
			show_close_icon = true,
			show_buffer_close_icons = true,
			buffer_close_icon = "",
			close_icon = "",

			modified_icon = "",
			close_command = "lua MiniBufremove.delete()",
			right_command = "lua MiniBufremove.delete()",
			tab_size = 15,
			color_icons = true,
			separator_style = "thick",

			hover = {
				enabled = true,
				reveal = { "close" },
			},
		},

		--  TODO: Convert this to work in monokai pro
		highlights = {
			background = {
				bg = "#32322E",
			},
		},
	},
}
