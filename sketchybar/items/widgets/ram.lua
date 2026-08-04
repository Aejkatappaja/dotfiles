local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local ram = sbar.add("item", "widgets.ram", {
	position = "right",
	icon = { string = "􀧖", color = colors.sora.sage },
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
	update_freq = 5,
})

ram:subscribe({ "routine", "forced" }, function(env)
	sbar.exec(
		"page_size=$(sysctl -n hw.pagesize) && total_mem=$(sysctl -n hw.memsize) && vm_stat | awk -v ps=\"$page_size\" -v tm=\"$total_mem\" '/Pages active/ {a=$3+0} /Pages wired/ {w=$4+0} /Pages compressed/ {c=$3+0} END {printf \"%.0f\", (a+w+c)*ps/tm*100}'",
		function(result)
			local used = tonumber(result)
			if used == nil then
				return
			end

			local color = colors.sora.sage
			if used > 50 then
				if used < 70 then
					color = colors.sora.gold
				elseif used < 85 then
					color = colors.semantic.warn
				else
					color = colors.semantic.error
				end
			end

			ram:set({
				label = { string = math.floor(used) .. "%", color = color },
			})
		end
	)
end)

ram:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)

sbar.add("bracket", "widgets.ram.bracket", { ram.name }, {
	background = { color = colors.bar.bg },
})

sbar.add("item", "widgets.ram.padding", {
	position = "right",
	width = settings.group_paddings,
})
