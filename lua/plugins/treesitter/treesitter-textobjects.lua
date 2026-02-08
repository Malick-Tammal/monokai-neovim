return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	cond = not vim.g.vscode,
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	enabled = true,

	init = function()
		vim.g.no_plugin_maps = true
	end,

	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					-- ['@class.outer'] = '<c-v>', -- blockwise
				},
				include_surrounding_whitespace = false,
			},
		})

		-----------------------------------------------------------
		--  INFO: Keymaps
		-----------------------------------------------------------

		--  INFO: Selecting ---

		local select = require("nvim-treesitter-textobjects.select")

		local function mapSelect(key, query, desc)
			vim.keymap.set({ "x", "o" }, key, function()
				select.select_textobject(query, "textobjects")
			end, { desc = desc })
		end

		--  TIP: Functions
		mapSelect("af", "@function.outer", "Select Around Function")
		mapSelect("if", "@function.inner", "Select Inside Function")

		--  TIP: Classes
		mapSelect("ac", "@class.outer", "Select Around Class")
		mapSelect("ic", "@class.inner", "Select Inside Class")

		--  TIP: Arguments / Parameters
		mapSelect("aa", "@parameter.outer", "Select Around Arg")
		mapSelect("ia", "@parameter.inner", "Select Inside Arg")

		--  TIP: Loops / conditionals
		mapSelect("al", "@loop.outer", "Select Around Loop")
		mapSelect("il", "@loop.inner", "Select Inside Loop")

		--  TIP: Blocks (Curly Braces / Objects / Scopes)
		mapSelect("ab", "@block.outer", "Select Around Block/Object")
		mapSelect("ib", "@block.inner", "Select Inside Block/Object")

		--  INFO: Movement (Jumping) ---

		local move = require("nvim-treesitter-textobjects.move")

		local function map_move(key, fn, query, desc)
			vim.keymap.set({ "n", "x", "o" }, key, function()
				fn(query, "textobjects")
			end, { desc = desc })
		end

		--  TIP: Functions
		map_move("]f", move.goto_next_start, "@function.outer", "Next Function Start")
		map_move("[f", move.goto_previous_start, "@function.outer", "Prev Function Start")

		map_move("]F", move.goto_next_end, "@function.outer", "Next Function End")
		map_move("[F", move.goto_previous_end, "@function.outer", "Prev Function End")

		--  TIP: Classes
		map_move("]c", move.goto_next_start, "@class.outer", "Next Class Start")
		map_move("[c", move.goto_previous_start, "@class.outer", "Prev Class Start")

		--  TIP: Arguments
		map_move("]a", move.goto_next_start, "@parameter.inner", "Next Argument")
		map_move("[a", move.goto_previous_start, "@parameter.inner", "Prev Argument")

		--  TIP: Logic (If / Loops)
		map_move("]i", move.goto_next_start, "@conditional.outer", "Next If/Else")
		map_move("[i", move.goto_previous_start, "@conditional.outer", "Prev If/Else")

		map_move("]l", move.goto_next_start, "@loop.outer", "Next Loop")
		map_move("[l", move.goto_previous_start, "@loop.outer", "Prev Loop")

		--  TIP: Returns
		map_move("]r", move.goto_next_start, "@return.outer", "Next Return")
		map_move("[r", move.goto_previous_start, "@return.outer", "Prev Return")

		--  TIP: Comments
		map_move("]/", move.goto_next_start, "@comment.outer", "Next Comment")
		map_move("[/", move.goto_previous_start, "@comment.outer", "Prev Comment")
	end,
}
