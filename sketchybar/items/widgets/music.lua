local colors = require("colors")
local settings = require("settings")

local artwork_path = "/tmp/sketchybar_artwork.jpg"

-- Order: right items render right-to-left
-- So: toggle first (rightmost), then text, then cover (leftmost)

local music_toggle = sbar.add("item", "widgets.music.toggle", {
	position = "right",
	icon = {
		string = "􀊆",
		color = colors.sora.purple,
		font = { size = 14.0 },
		padding_left = 4,
		padding_right = 8,
	},
	label = { drawing = false },
	padding_left = 0,
	padding_right = 1,
	drawing = false,
})

local music = sbar.add("item", "widgets.music", {
	position = "right",
	icon = { drawing = false },
	label = {
		string = "",
		color = colors.sora.steel,
		font = {
			family = settings.font.text,
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
		max_chars = 20,
		scroll_duration = 80,
		padding_left = 4,
		padding_right = 4,
	},
	scroll_texts = true,
	padding_left = 0,
	padding_right = 0,
	drawing = false,
})

local music_cover = sbar.add("item", "widgets.music.cover", {
	position = "right",
	background = {
		image = { string = artwork_path, scale = 0.03, corner_radius = 4 },
		color = colors.transparent,
		border_width = 0,
	},
	icon = { drawing = false },
	label = { drawing = false },
	width = 24,
	padding_left = 4,
	padding_right = -4,
	drawing = false,
})

sbar.add("bracket", "widgets.music.bracket", {
	music_cover.name,
	music.name,
	music_toggle.name,
}, {
	background = { color = colors.bar.bg },
})

sbar.add("item", "widgets.music.padding", {
	position = "right",
	width = settings.group_paddings,
})

local poller = sbar.add("item", {
	drawing = false,
	update_freq = 3,
	updates = true,
})

local last_track = ""
local is_playing = false

poller:subscribe({ "routine", "forced" }, function(env)
	sbar.exec("nowplaying-cli get title artist playbackRate", function(result)
		local lines = {}
		for line in result:gmatch("[^\r\n]+") do
			table.insert(lines, line)
		end

		local title = lines[1] or "null"
		local artist = lines[2] or "null"
		local rate = lines[3] or "0"

		if title ~= "null" and (rate == "1" or rate == "0") then
			is_playing = (rate == "1")
			music:set({
				drawing = true,
				label = { string = artist .. " — " .. title },
			})
			music_cover:set({ drawing = true })
			music_toggle:set({
				drawing = true,
				icon = { string = is_playing and "􀊆" or "􀊄" },
			})

			local track_id = artist .. title
			if track_id ~= last_track then
				last_track = track_id
				sbar.exec("nowplaying-cli get artworkData | base64 --decode > " .. artwork_path, function()
					music_cover:set({
						background = { image = { string = artwork_path, scale = 0.03 } },
					})
				end)
			end
		else
			music:set({ drawing = false })
			music_cover:set({ drawing = false })
			music_toggle:set({ drawing = false })
		end
	end)
end)

music_toggle:subscribe("mouse.clicked", function(env)
	sbar.exec("nowplaying-cli togglePlayPause")
end)

music:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Music'")
end)

music_cover:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Music'")
end)
