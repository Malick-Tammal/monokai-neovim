return {
	"yetone/avante.nvim",
	cond = not vim.g.vscode,
	build = "make", -- ⚠️ must add this line! ! !
	event = { "BufReadPre", "BufNewFile" },
	enabled = false,

	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		provider = "gemini", -- default provider
		providers = {
			gemini = {},
		},
	},
	dependencies = {
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
	},
}
