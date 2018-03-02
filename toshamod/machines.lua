minetest.register_alias("spinner", "toshamod:spinner")

minetest.register_craft({
	output = 'toshamod:spinner',
	recipe = {
		{'',            'defualt:wood',          ''},
		{'defualt:wood',          'technic:motor', 'defualt:wood'},
		{'defualt:wood', 'technic:lv_cable',       'defualt:wood'},
	}
})

technic.register_spinner({tier = "LV", demand = {300}, speed = 1})

minetest.register_node("toshamod:spinner", {
			description = ("%s Spinner"):format("LV"),
		tiles = {"spinner.png"},
		groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2,
			technic_machine=1, technic_lv=1},
		connect_sides = {"bottom"},
		sounds = default.node_sound_wood_defaults(),
		on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", S("%s Spinner"):format("LV"))
		set_display(meta)
	end,
	
		local run = function(pos, node)
	local meta         = minetest.get_meta(pos)
	local eu_input     = meta:get_int("LV_EU_input")
	local machine_name = S("%s Spinner"):format("LV")
	local machine_node = "toshamod:spinner"
	local demand       = 300
	local pos_hash      = minetest.hash_node_position(pos)
	local music_handle  = music_handles[pos_hash]

	-- Setup meta data if it does not exist.
	if not eu_input then
		meta:set_int("LV_EU_demand", demand)
		meta:set_int("LV_EU_input", 0)
		return
	end

			if meta:get_int("active") == 0 then
		meta:set_string("infotext", S("%s Idle"):format(machine_name))
		meta:set_int("LV_EU_demand", 0)
		return
	end
			
			
