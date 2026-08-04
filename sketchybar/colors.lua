-- Active theme: "sora" | "gruvbox" | "cendre"
local theme = "cendre"

local themes = {
	sora = {
		black = 0xff0e1018,
		white = 0xffc8d0e0,
		red = 0xffc46c78,
		green = 0xff90c8a0,
		blue = 0xff80c8e0,
		yellow = 0xffd4b878,
		orange = 0xffd0a888,
		magenta = 0xffb0a0d8,
		grey = 0xff586478,
		shadow = 0xff0a0c12,

		-- accent set (exposed as colors.sora.*)
		accent = {
			cyan = 0xff80c8e0,
			purple = 0xffb0a0d8,
			sage = 0xff90c8a0,
			rose = 0xffd0909c,
			gold = 0xffd4b878,
			peach = 0xffd0a888,
			teal = 0xff78b8b0,
			steel = 0xff8898b8,
			-- the bar's own accent: apple, clock, active space, default icon
			primary = 0xff80c8e0,
		},

		-- status, not syntax: thresholds and failures only. warn must not be
		-- gold, the cran below it in the cpu/ram ramp.
		semantic = {
			error = 0xffc46c78,
			warn = 0xffd0a888,
			ok = 0xff90c8a0,
			info = 0xff80c8e0,
		},

		highlight = 0xff8898b8,
		bar = { bg = 0xcc0e1018, border = 0xff222838 },
		popup = { bg = 0xc014161e, border = 0xff586478 },
		bg1 = 0xff1e2430,
		bg2 = 0xff222838,
	},

	-- Gruvbox Material (dark, medium)
	gruvbox = {
		black = 0xff282828,
		white = 0xffd4be98,
		red = 0xffea6962,
		green = 0xffa9b665,
		blue = 0xff7daea3,
		yellow = 0xffd8a657,
		orange = 0xffe78a4e,
		magenta = 0xffd3869b,
		grey = 0xff928374,
		shadow = 0xff1d2021,

		accent = {
			cyan = 0xff7daea3,
			purple = 0xffd3869b,
			sage = 0xffa9b665,
			rose = 0xffea6962,
			gold = 0xffd8a657,
			peach = 0xffe78a4e,
			teal = 0xff89b482,
			steel = 0xff928374,
			primary = 0xff7daea3,
		},

		semantic = {
			error = 0xffea6962,
			warn = 0xffe78a4e,
			ok = 0xffa9b665,
			info = 0xff7daea3,
		},

		highlight = 0xffd4be98,
		bar = { bg = 0xcc171717, border = 0xff3c3836 },
		popup = { bg = 0xc01d2021, border = 0xff928374 },
		bg1 = 0xff32302f,
		bg2 = 0xff3c3836,
	},

	-- Cendre (hard) -- canonical palette from lua/cendre/palette.lua
	cendre = {
		black = 0xff171311,
		white = 0xffe6d5c2,
		red = 0xffd1766e,
		green = 0xff99af6b,
		blue = 0xff58bdff,
		yellow = 0xfffcba81,
		orange = 0xffea9875,
		magenta = 0xff9480ba,
		grey = 0xffa09384,
		shadow = 0xff0f0c0a,

		-- The five pigments, under the accent names this config already uses.
		-- cyan was 0xff58bdff, which is semantic.info: a diagnostic worn as an
		-- everyday accent. frost is the palette's only cool pigment.
		accent = {
			cyan = 0xff4e89a2, -- frost
			purple = 0xff9480ba, -- potassium
			sage = 0xff99af6b, -- sap
			rose = 0xffd1766e, -- cinder
			gold = 0xfffcba81, -- brass
			peach = 0xffea9875, -- ember
			teal = 0xff4e89a2, -- frost
			steel = 0xffa09384, -- fg_dim
			-- the bar's own accent. Warm here, because the ground is hue 43 and
			-- a cool bar over an ash desk reads as two systems.
			primary = 0xffea9875, -- ember
		},

		-- Diagnostics carry more chroma than any pigment, on purpose, so a
		-- failing widget never wears the same red as a keyword.
		semantic = {
			error = 0xffd25780,
			warn = 0xfff4a21c,
			ok = 0xff43b16a,
			info = 0xff58bdff,
		},

		highlight = 0xffe6d5c2,
		bar = { bg = 0xcc171311, border = 0xff362f2c },
		popup = { bg = 0xc00f0c0a, border = 0xff362f2c },
		bg1 = 0xff201b19,
		bg2 = 0xff2a2422,
	},
}

local t = themes[theme]

return {
	black = t.black,
	white = t.white,
	red = t.red,
	green = t.green,
	blue = t.blue,
	yellow = t.yellow,
	orange = t.orange,
	magenta = t.magenta,
	grey = t.grey,
	shadow = t.shadow,
	transparent = 0x00000000,

	sora = t.accent,
	semantic = t.semantic,
	highlight = t.highlight,
	bar = t.bar,
	popup = t.popup,
	bg1 = t.bg1,
	bg2 = t.bg2,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
