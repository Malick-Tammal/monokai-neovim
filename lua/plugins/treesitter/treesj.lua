return {
	"Wansmer/treesj",
	dir = "~/Projects/treesj",
	event = { "BufReadPre", "BufNewFile" },

	-- HACK: Config
	config = function()
		local tsj = require("treesj")

		tsj.setup({
			max_join_length = 300,
			use_default_keymaps = false,
		})

		-----------------------------------------------------------
		--  INFO: Keymaps
		-----------------------------------------------------------

		vim.keymap.set("n", "<leader>w", function()
			require("treesj").toggle()
		end)
	end,
}
