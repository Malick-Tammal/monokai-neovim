return {
	"milanglacier/minuet-ai.nvim",
	cond = not vim.g.vscode,
	event = "InsertEnter",
	enabled = false,

	keys = {
		{
			"<leader>tm",
			"<Cmd>Minuet virtualtext toggle<CR>",
		},
	},

	config = function()
		require("minuet").setup({
			provider = "gemini",
			throttle = 2500,
			debounce = 800,
			request_timeout = 5,
			notify = "warn",
			provider_options = {
				gemini = {
					model = "gemini-3.5-flash-lite",
					api_key = "GEMINI_KEY",
					stream = false,
					optional = {
						generationConfig = {
							maxOutputTokens = 256,
							temperature = 0.2,
						},
					},
				},
			},
			virtualtext = {
				auto_trigger_ft = { "*" },
				show_on_completion_menu = true,
				keymap = {
					accept = "<M-k>",
					accept_line = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<M-e>",
				},
			},
		})
	end,
}
