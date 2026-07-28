return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIconsInstallPack material",
	cond = not vim.g.vscode,
	event = "VeryLazy",
	enabled = true,

	config = function()
		local icon_dir = vim.fn.stdpath("config") .. "/assets/icons/"

		require("real-icons").setup({
			pack = "flow",

			packs = {
				flow = {
					type = "vscode",
					path = vim.fn.expand("~/.vscode-oss/extensions/thang-nm.flow-icons-2.0.3-universal"),
					theme = "flow-dim",
					license = "personal",
				},
			},

			overrides = {
				extensions = {
					qml = icon_dir .. "qml.svg",
				},
				filenames = {
					["hyprland.conf"] = icon_dir .. "hyprland.svg",
					["hyprland.lua"] = icon_dir .. "hyprland.svg",
					["hypridle.conf"] = icon_dir .. "hyprland.svg",
					["hyprlock.conf"] = icon_dir .. "hyprland.svg",
				},
			},

			integrations = {
				neo_tree = true,
				bufferline = true,
				mini_files = true,
				telescope = true,
				telescope_file_browser = true,
				lualine = true,
			},
		})
	end,
}
