return {
	"folke/snacks.nvim",
	cond = not vim.g.vscode,
	lazy = false,
	priority = 1000,
	enabled = true,

	-- HACK: Config

	---@type snacks.Config
	opts = {

		-- INFO: Smooth scroll
		scroll = {
			enabled = false,

			-- INFO: Animation
			animate = {
				fps = 60,
				easing = "outCubic",
				duration = {
					step = 20,
					total = 300,
				},
			},
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 5, total = 50 },
				easing = "linear",
			},
		},

		-- INFO: Dimming
		dim = {
			enabled = true,
		},

		-- INFO: Indent
		indent = {
			enabled = true,
			priority = 1,
			scope = {
				enabled = true,
				-- char = "┃",
				char = "│",
			},
		},

		-- INFO: Word highlight
		words = { enabled = true },

		-- INFO: Picker (Buffers / Smart file picker)
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = {
						layout = {
							position = "right",
							box = "vertical",
							width = 40,
							{
								win = "input",
								height = 1,
								border = "rounded",
								title = "Snacks Picker",
								wo = {
									winhighlight = "FloatBorder:SnacksExplorerBorder,NormalFloat:SnacksExplorerNormal,SnacksPickerPrompt:SnacksPickerPromptTransparent,Title:SnacksPickerInputTitle",
								},
							},
							{
								win = "list",
								border = "none",
								wo = {
									winhighlight = "FloatBorder:SnacksExplorerBorder,NormalFloat:SnacksExplorerNormal",
								},
							},
						},
					},
					hidden = true,
					auto_close = true,
				},
			},
		},

		-- INFO: Bigfile saver
		bigfile = {
			enabled = true,
			notify = true,
			size = 1.5 * 1024 * 1024, -- 1.5mb
		},

		notifier = {
			enabled = false,
			timeout = 1000,
			margin = { top = 1, right = 2, bottom = 0 },
		},

		-- INFO: Quick file rendering
		quickfile = { enabled = true },

		statuscolumn = {
			enabled = true,
			left = { "mark", "sign" }, -- priority of signs on the left (high to low)
			right = { "fold", "git" }, -- priority of signs on the right (high to low)
			folds = {
				open = true, -- show open fold icons
				git_hl = false, -- use Git Signs hl for fold icons
			},
			git = {
				-- patterns to match Git signs
				patterns = { "GitSign", "MiniDiffSign" },
			},
			refresh = 50, -- refresh at most every 50ms
		},

		lazygit = {
			enabled = true,
			theme = {
				inactiveBorderColor = { fg = "StatusLineNC" },
			},
		},

		-- INFO: Dashboard (welcome screen)
		dashboard = {
			enabled = true,
			width = 30,
			pane_gap = 0,
			preset = {
				keys = {
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "Find File", hl = "SnacksDashboardText", width = 30 },
							{ "[f]", hl = "SnacksDashboardKey" },
						},
						key = "f",
						action = ":Telescope find_files",
					},
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "New File", hl = "SnacksDashboardText", width = 30 },
							{ "[n]", hl = "SnacksDashboardKey" },
						},
						key = "n",
						action = ":ene | startinsert",
					},
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "Recent Files", hl = "SnacksDashboardText", width = 30 },
							{ "[r]", hl = "SnacksDashboardKey" },
						},
						key = "r",
						action = ":Telescope oldfiles",
					},
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "Explorer", hl = "SnacksDashboardText", width = 30 },
							{ "[e]", hl = "SnacksDashboardKey" },
						},
						key = "e",
						action = ":lua require('mini.files').open()",
					},
					{
						text = {
							{ "󰅨", hl = "SnacksDashboardText", width = 2 },
							{ "Projects", hl = "SnacksDashboardText", width = 30 },
							{ "[p]", hl = "SnacksDashboardKey" },
						},
						key = "p",
						action = ":lua require('plugins.custom.projects').setup()",
					},
					{
						text = {
							{ "󰊢", hl = "SnacksDashboardText", width = 2 },
							{ "Lazy Git", hl = "SnacksDashboardText", width = 30 },
							{ "[g]", hl = "SnacksDashboardKey" },
						},
						key = "g",
						action = ":lua Snacks.lazygit()",
					},
					{
						text = {
							{ "󰈭", hl = "SnacksDashboardText", width = 2 },
							{ "Find Text (Grep)", hl = "SnacksDashboardText", width = 30 },
							{ "[t]", hl = "SnacksDashboardKey" },
						},
						key = "t",
						action = ":Telescope live_grep",
					},
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "Config", hl = "SnacksDashboardText", width = 30 },
							{ "[c]", hl = "SnacksDashboardKey" },
						},
						key = "c",
						action = ":lua vim.cmd('cd ~/dotfiles/.config/nvim') vim.cmd('edit ~/dotfiles/.config/nvim/init.lua')",
					},
					{
						text = {
							{ "", hl = "SnacksDashboardText", width = 2 },
							{ "Quit", hl = "SnacksDashboardText", width = 30 },
							{ "[q]", hl = "SnacksDashboardKey" },
						},
						key = "q",
						action = ":qa",
					},
				},
				header = [[
          ▄ ▄
      ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄
      █ ▄ █▄█ ▄▄▄ █ █▄█ █ █
   ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █
 ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄
▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █
█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █
   █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█
	
        [ malick.dev ] ]],
			},
			sections = {
				{ section = "header", padding = 0, align = "left" },
				{ section = "keys", gap = 0.8, padding = 1 },
				{ section = "startup", padding = 5 },
			},
		},
	},
}
