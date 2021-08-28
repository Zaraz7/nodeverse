--[[
This file controls how data is persented to the player in the HUD.

# INDEX
	ENTRY POINT
]]--

local players_data = rocket.players_data

local base_position = {x=0.05, y=0.07}

local function delete_old_hud(player, hud_name)
	local name = player:get_player_name()
	local old_hud = players_data[name][hud_name .. "_hud"]
	if old_hud ~= nil then
		player:hud_remove(old_hud)
		players_data[name][hud_name .. "_hud"] = nil
	end
end

--[[
 # ENTRY POINT
]]--

function rocket.update_hud(player)
	local name = player:get_player_name()
	if players_data[name] == nil then
		return
	end
	-- Update thrust icons
	if not players_data[name].is_rocket then
		players_data[name].thrust = nil
	end
	local old_thrust = players_data[name].visible_thrust
	local new_thrust = players_data[name].thrust
	if new_thrust ~= old_thrust then
		-- Delete old HUD
		delete_old_hud(player, "thrust")
		-- Add new HUD
		if new_thrust == nil then
			players_data[name].thrust_hud = nil
		elseif new_thrust == "full" then
			players_data[name].thrust_hud = player:hud_add {
				hud_elem_type = "image",
				position = base_position,
				scale = {x=4, y=4},
				text = "icon_full_thrust.png",
				alignment = {x=1, y=1},
				offset = {x=0, y=60}
			}
		elseif new_thrust == "low" then
			players_data[name].thrust_hud = player:hud_add {
				hud_elem_type = "image",
				position = base_position,
				scale = {x=4, y=4},
				text = "icon_low_thrust.png",
				alignment = {x=1, y=1},
				offset = {x=0, y=60}
			}
		end
		players_data[name].visible_thrust = new_thrust
	end
	-- Update crash danger icon
	local vel = player:get_velocity()
	local new_danger = nil
	-- Empirical, only slightly (-0.5) conservative value for fall damage
	if players_data[name].is_rocket and vel.y < -14 then
		new_danger = "crash"
	end
	local old_danger = players_data[name].visible_danger
	if new_danger ~= old_danger then
		-- Delete old HUD
		delete_old_hud(player, "danger")
		-- Add new HUD
		if new_danger == nil then
			players_data[name].danger_hud = nil
		elseif new_danger == "crash" then
			players_data[name].danger_hud = player:hud_add {
				hud_elem_type = "image",
				position = base_position,
				scale = {x=4, y=4},
				text = "icon_crash_danger.png",
				alignment = {x=1, y=1},
				offset = {x=80, y=60}
			}
		end
		players_data[name].visible_danger = new_danger
	end
	-- Update fuel icon
	local new_fuel = players_data[name].fuel
	local old_fuel = players_data[name].visible_fuel
	if not players_data[name].is_rocket then
		new_fuel = nil
	end
	if new_fuel ~= nil then
		new_fuel = math.floor(new_fuel*78/100) + 1
	end
	if old_fuel ~= nil then
		old_fuel = math.floor(old_fuel*78/100) + 1
	end
	if new_fuel ~= old_fuel then
		-- Delete old HUD
		delete_old_hud(player, "fuel_outline")
		delete_old_hud(player, "fuel_bar")
		-- Add new HUD
		if new_fuel ~= nil then
			if new_fuel <= 0 then
				players_data[name].fuel_bar_hud = nil
			else
				players_data[name].fuel_bar_hud = player:hud_add {
					hud_elem_type = "image",
					position = base_position,
					scale = {x=4*new_fuel/78, y=4.5},
					text = "icon_fuel_bar.png",
					alignment = {x=1, y=1},
					offset = {x=1, y=1},
				}
			end
			players_data[name].fuel_outline_hud = player:hud_add {
				hud_elem_type = "image",
				position = base_position,
				scale = {x=4, y=4},
				text = "icon_fuel_outline.png",
				alignment = {x=1, y=1},
				offset = {x=0, y=0},
			}
		end
		players_data[name].visible_fuel = new_fuel
	end
end
