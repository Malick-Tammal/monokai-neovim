return {
	"nvim-lualine/lualine.nvim",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	enabled = true,

	dependencies = {
		"bwpge/lualine-pretty-path",
		"Mirsmog/real-icons.nvim",
	},

	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local mode = {
			"mode",
			separator = { left = "" },
			fmt = function(str)
				return " " .. str .. " "
			end,
		}

		local progress = {
			"progress",
			separator = { right = "" },
			left_padding = 2,
			fmt = function(str)
				return " " .. str
			end,
		}

		local location = {
			"location",
			fmt = function(str)
				return str .. " "
			end,
		}

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
			colored = true,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
			component_separators = { right = "   " },
			fmt = function(str)
				if str ~= "" then
					return "[ " .. str .. "%#lualine_x_normal# ]"
				end
				return ""
			end,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " },
			cond = hide_in_width,
		}

		local real_icon = {
			require("real-icons.integrations.lualine").component,
			padding = { left = 1, right = 0 },
		}

		local pretty_path = {
			"pretty_path",
			icon_show = false,
			use_symbols = false,
			padding = { left = 1, right = 1 },
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "snacks_dashboard", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { { "branch", icon = "" } },
				lualine_c = { real_icon, pretty_path },
				lualine_d = {
					function()
						return require("lsp-progress").progress()
					end,
				},
				lualine_x = {
					diagnostics,
					diff,
				},
				lualine_y = { location },
				lualine_z = { progress },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "neo-tree" },
		})
	end,
}
