return {
	"Mirsmog/real-icons.nvim",
	build = ":RealIconsInstallPack material",
	cond = not vim.g.vscode,
	-- event = "VeryLazy",
	enabled = true,

	config = function()
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
					qml = "../../assets/icons/qml.svg",
				},
				filenames = {
					["hyprland.conf"] = "../../assets/icons/hyprland.svg",
					["hyprland.lua"] = "../../assets/icons/hyprland.svg",
					["hypridle.conf"] = "../../assets/icons/hyprland.svg",
					["hyprlock.conf"] = "../../assets/icons/hyprland.svg",
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
