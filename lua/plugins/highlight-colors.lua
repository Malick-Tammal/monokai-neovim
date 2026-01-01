return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,

	config = function()
		-- Ensure termguicolors is enabled if not already

		require("nvim-highlight-colors").setup({
			-- render = "background",

			--  INFO: Virtual
			render = "virtual",
			-- virtual_symbol = "󱓻",
			virtual_symbol = '■',
			virtual_symbol_position = "inline",

			enable_named_colors = true,
			enable_tailwind = true,
			exclude_filetypes = { 'lazy', 'mason', 'help' },
			exclude_buftypes = { 'terminal' },
		})
	end,
}
