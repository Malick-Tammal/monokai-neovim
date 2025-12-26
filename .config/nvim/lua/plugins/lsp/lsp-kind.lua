return {
	"onsails/lspkind.nvim",

	config = function()
		require("lspkind").init({
			mode = "symbol",

			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "",
				Constructor = "",
				Field = "󰜢",
				Variable = "󱄑",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		})
	end,
}
