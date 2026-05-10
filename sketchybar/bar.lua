local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 40,
	color = colors.transparent,
	-- color = colors.bar.bg,
	padding_right = 8,
	padding_left = 0,
	corner_radius = 9,
	margin = 14,
	sticky = "on",
	y_offset = 10,
	shadow = true,
	blur_radius = 0,
	-- border_width = 3,
	-- border_color = colors.gruv.cream,
})
