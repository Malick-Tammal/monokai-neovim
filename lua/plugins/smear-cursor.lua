return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",
	enabled = false,

	opts = {

		-- INFO: Snooth without smear
		stiffness = 0.5,
		trailing_stiffness = 0.5,
		matrix_pixel_threshold = 0.5,

		--  INFO: Custom fast
		-- legacy_computing_symbols_support = true,
		-- stiffness = 0.6,
		-- trailing_stiffness = 0.3,
		-- trailing_exponent = 3,
		-- trailing_stiffness_insert_mode = 0.6,
		-- stiffness_insert_mode = 0.6,
		-- distance_stop_animating = 0.5,
		-- transparent_bg_fallback_color = "#303030",
		-- cursor_color = "#E9ED80",
		-- never_draw_over_target = true,
		-- hide_target_hack = true,

		--  INFO: Fire hazard
		-- cursor_color = "#ff8800",
		-- stiffness = 0.3,
		-- trailing_stiffness = 0.1,
		-- trailing_exponent = 5,
		-- never_draw_over_target = true,
		-- hide_target_hack = true,
		-- gamma = 1,
	},
}
