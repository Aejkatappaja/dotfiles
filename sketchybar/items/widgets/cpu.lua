local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("item", "widgets.cpu", {
	position = "right",
	icon = { string = icons.cpu, color = colors.sora.steel },
	label = {
		string = "??%",
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 13.0,
		},
		width = 42,
	},
	padding_right = 1,
	padding_left = 1,
})

cpu:subscribe("cpu_update", function(env)
	local load = tonumber(env.total_load)

	local color = colors.sora.cyan
	if load > 30 then
		if load < 60 then
			color = colors.sora.gold
		elseif load < 80 then
			color = colors.semantic.warn
		else
			color = colors.semantic.error
		end
	end

	cpu:set({
		label = { string = env.total_load .. "%", color = color },
	})
end)

cpu:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("bracket", "widgets.cpu.bracket", { cpu.name }, {
	background = { color = colors.bar.bg },
})

sbar.add("item", "widgets.cpu.padding", {
	position = "right",
	width = settings.group_paddings,
})
