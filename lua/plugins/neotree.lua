return {
	"nvim-neo-tree/neo-tree.nvim",
	cond = not vim.g.vscode,
	branch = "v3.x",
	event = "VeryLazy",

	--  INFO: Keymaps
	keys = {
		{ "<leader>tn", "<Cmd>Neotree toggle<CR>", desc = "Explorer Neotree" },
	},

	--  INFO: Config
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_cursor_hijack = true,
		hide_root_node = true,

		sources = {
			"filesystem",
			"buffers",
			"git_status",
		},

		window = {
			position = "left",
			width = 40,

			-- INFO: Keymaps
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["z"] = "close_all_nodes",
				["A"] = "add_directory",
				["P"] = {
					"toggle_preview",
					config = {
						use_float = true,
						use_image_nvim = true,
						title = "󰍹 Quick Preview",
					},
				},
				["<C-b>"] = { "scroll_preview", config = { direction = -10 } },
				["<C-f>"] = { "scroll_preview", config = { direction = 10 } },
			},
		},

		-- INFO: Showing reletive numbers
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.opt_local.number = false
					vim.opt_local.relativenumber = false
					vim.opt_local.signcolumn = "no"
					vim.opt_local.foldcolumn = "0"
					-- vim.opt_local.winhighlight =
					-- 	"LineNr:NeoTreeNormal,CursorLineNr:NeoTreeCursorLineNr,SignColumn:NeoTreeSignColumn"
				end,
			},
		},

		filesystem = {
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			filtered_items = {
				visible = false,
				hide_dotfiles = true,
				hide_gitignored = false,
				hide_hidden = true,
				hide_by_name = {
					"node_modules",
				},
				hide_by_pattern = {
					--"*.meta",
					--"*/src/*/tsconfig.json",
				},
				always_show = {
					"dist",
				},
				always_show_by_pattern = {
					--".env*",
				},
				never_show = {
					--".DS_Store",
					--"thumbs.db"
				},
				never_show_by_pattern = {
					--".null-ls_*",
				},
			},

			-- INFO: Custom delete command for trash cli
			commands = {
				delete = function(state)
					local node = state.tree:get_node()
					local inputs = require("neo-tree.ui.inputs")

					inputs.confirm("Are you sure you want to trash " .. node.name .. "?", function(confirmed)
						if not confirmed then
							return
						end

						-- Use trash-put from trash-cli
						vim.fn.system({ "trash-put", vim.fn.fnameescape(node.path) })
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,
			},
		},

		default_component_configs = {

			-- INFO: Icons
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
				folder_empty_open = "",
				default = "*",
				highlight = "NeoTreeFileIcon",
			},
			provider = function(icon, node, state)
				if node.type == "file" or node.type == "terminal" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					local name = node.type == "terminal" and "terminal" or node.name
					if success then
						local devicon, hl = web_devicons.get_icon(name)
						icon.text = devicon or icon.text
						icon.highlight = hl or icon.highlight
					end
				end
			end,

			modified = {
				symbol = "",
				highlight = "NeoTreeModified",
			},

			git_status = {
				symbols = {
					-- Change type
					added = "✚",
					deleted = "✖",
					modified = "",
					renamed = "󰁕",
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "",
					staged = "",
					conflict = "",
				},
				align = "left",
			},

			-- INFO: Indent
			indent = {
				indent_size = 2,
				padding = 2,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},

		renderers = {
			file = {
				{ "indent" },
				{ "modified", zindex = 20, align = "right" },
				{ "diagnostics", zindex = 20, align = "right" },
				{ "icon" },
				{
					"container",
					content = {
						{
							"name",
							zindex = 10,
						},
						{
							"symlink_target",
							zindex = 10,
							highlight = "NeoTreeSymbolicLinkTarget",
						},
						{ "clipboard", zindex = 10 },
						{ "bufnr", zindex = 10 },
						{ "git_status", zindex = 10, align = "right" },
						{ "file_size", zindex = 10, align = "right" },
						{ "type", zindex = 10, align = "right" },
						{ "last_modified", zindex = 10, align = "right" },
						{ "created", zindex = 10, align = "right" },
					},
				},
			},
		},
	},
}
