return {
	"j-hui/fidget.nvim",
	event = "LspAttach", -- load it when an LSP attaches
	config = function()
		require("fidget").setup({
			progress = {
				display = {
					done_icon = "🎉", -- Icon shown when all LSP progress tasks are complete
				},
				window = {
					winblend = 0,
				},
			},
		})
	end,
}
