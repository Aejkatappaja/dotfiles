local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local clock = sbar.add("item", {
	icon = {
		string = "􀐫",
		color = colors.sora.primary,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Bold"],
			size = 14.0,
		},
	},
	label = {
		color = colors.sora.primary,
		padding_right = 8,
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 13.0,
		},
	},
	position = "right",
	update_freq = 1,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bar.bg,
		border_width = 2,
	},
})

sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		string = "􀉉",
		color = colors.sora.steel,
		padding_left = 8,
		font = {
			style = settings.font.style_map["Bold"],
			size = 14.0,
		},
	},
	label = {
		color = colors.sora.steel,
		padding_right = 8,
		font = {
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
	},
	position = "right",
	update_freq = 30,
	padding_left = 1,
	padding_right = 1,
	background = {
		color = colors.bar.bg,
		border_width = 2,
	},
})

-- Double border for clock
sbar.add("bracket", { clock.name }, {
	background = {
		color = colors.transparent,
		height = 26,
		border_color = colors.bg2,
	},
})

-- Double border for calendar
sbar.add("bracket", { cal.name }, {
	background = {
		color = colors.transparent,
		height = 26,
		border_color = colors.bg2,
	},
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

clock:subscribe({ "forced", "routine", "system_woke" }, function(env)
	clock:set({ label = os.date("%I:%M %p"):lower() })
end)

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ label = os.date("%a. %d %b.") })
end)
