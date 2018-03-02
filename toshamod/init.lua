minetest.register_node("toshamod:thorium_block", {
	description = "Thorium Block",
	tiles = {"thoriumblock.png"},
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=0,flamable=1,stone=1},

})
	
minetest.register_craft({
	output = "toshamod:thorium_block",
	recipe ={
	{"toshamod:thorium_ingot", "toshamod:thorium_ingot","toshamod:thorium_ingot"},
	{"toshamod:thorium_ingot", "toshamod:thorium_ingot","toshamod:thorium_ingot"},
	{"toshamod:thorium_ingot", "toshamod:thorium_ingot","toshamod:thorium_ingot"},
	}

})

minetest.register_craftitem("toshamod:thorium_ingot", {
	description = "Thorium Ingot",
	inventory_image = "thorium_ingot.png",
})

minetest.register_craftitem("toshamod:rubium_ingot", {
	description = "Rubium Ingot",
	inventory_image = "rubium_ingot.png",
})

minetest.register_craft({
	output = "toshamod:thorium_ingot 9",
	recipe ={
	{"toshamod:thorium_block"},
	}	
})

minetest.register_node("toshamod:thorium_ore", {
	description = "Thorium Ore",
	tiles = {"thorium_ore.png"},
	groups = {cracky = 1,stone = 1},
	drop = "toshamod:thorium_lump"
})

minetest.register_craftitem("toshamod:thorium_lump", {
	description = "Thorium Lump",
	inventory_image = "thorium_lump.png"
})

minetest.register_craft({
	type = "cooking",
	output = "toshamod:thorium_ingot",
	recipe = "toshamod:thorium_lump",
	cooktime = 5,
})

minetest.register_abm({
	nodenames = {"technic:granite"},
	interval = 200,
	chance = 90,	
	action = function(pos, node)
        minetest.set_node(pos, {name = "toshamod:thorium_ore"})
    end
})

minetest.register_craftitem("toshamod:thorium_rod", {
	description = "Thorium Rod",
	inventory_image = "thorium_rod.png"
})

minetest.register_craft({
	output = "toshamod:thorium_rod 2",
	recipe = { 
{"", "", "toshamod:thorium_ingot"}, 
{"", "toshamod:thorium_ingot", ""}, 
{"toshamod:thorium_ingot", "", ""},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "toshamod:thorium_rod",
	burntime = 60,
})

minetest.register_tool("toshamod:thorium_pickaxe", {
    description = "Thorium Pickaxe",
    inventory_image = "thorium_pickaxe.png",
    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=0.80, [2]=0.50, [3]=0.20}, uses=25, maxlevel=3}
        }	
    }
})

minetest.register_craft({
	output = "toshamod:thorium_pickaxe",
	recipe = { 
{"toshamod:thorium_ingot", "toshamod:thorium_ingot", "toshamod:thorium_ingot"}, 
{"", "toshamod:thorium_rod", ""}, 
{"", "toshamod:thorium_rod", ""}
	}
})

minetest.register_tool("toshamod:thorium_sword", {
	description = "Thorium Sword",
	inventory_image = "thorium_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "toshamod:thorium_sword",
	recipe = { 
{"", "toshamod:thorium_ingot", ""}, 
{"", "toshamod:thorium_ingot", ""}, 
{"", "toshamod:thorium_rod", ""}
	}
})

minetest.register_tool("toshamod:thorium_axe", {
	description = "Thorium Axe",
	inventory_image = "thorium_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.10, [2]=0.90, [3]=0.50}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("toshamod:thorium_shovel", {
	description = "Thorium Shovel",
	inventory_image = "thorium_shovel.png",
	wield_image = "thorium_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=25, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
	output = "toshamod:thorium_shovel",
	recipe = { 
{"", "toshamod:thorium_ingot", ""}, 
{"", "toshamod:thorium_rod", ""}, 
{"", "toshamod:thorium_rod", ""}
	}
})

minetest.register_craft({
	output = "toshamod:thorium_axe",
	recipe = { 
{"toshamod:thorium_ingot", "toshamod:thorium_ingot", ""}, 
{"toshamod:thorium_ingot", "toshamod:thorium_rod", ""}, 
{"", "toshamod:thorium_rod", ""}
	}
})

minetest.register_craftitem("toshamod:oil", {
	description = "Congealed Oil",
	inventory_image = "oil.png"
})

minetest.register_craftitem("toshamod:plastic", {
	description = "Plastic Sheeting",
	inventory_image = "plastic.png"
})

minetest.register_tool("toshamod:oil_rig", {
	description = "Mini Oil Rig",
	inventory_image = "oil_rig.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local pos = pointed_thing.under
		if minetest.is_protected(pos, user:get_player_name()) then
			minetest.record_protection_violation(pos, user:get_player_name())
			return
		end
		local node = minetest.get_node(pos)
		local node_name = node.name
		if node_name ~= "default:sand" then
			return
		end
		node.name = "default:silver_sand"
		minetest.swap_node(pos, node)
		minetest.handle_node_drops(pointed_thing.above, {"toshamod:oil"}, user)
		if not technic.creative_mode then
			local item_wear = tonumber(itemstack:get_wear())
			item_wear = item_wear + 819
			if item_wear > 65535 then
				itemstack:clear()
				return itemstack
			end
			itemstack:set_wear(item_wear)
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = "toshamod:oil_rig",
	recipe = { 
{"", "toshamod:thorium_rod", ""}, 
{"defualt:stick", "technic:stainless_steel_ingot", "defualt:stick"}, 
{"defualt:stick", "", "defualt:stick"}
	}
})

minetest.register_craft({
	type = "cooking",
	output = "toshamod:plastic",
	recipe = "toshamod:oil",
	cooktime = 5,
})

minetest.register_craft({
	output = "technic:lv_cable 12",
	recipe = { 
{"toshamod:plastic", "toshamod:plastic", "toshamod:plastic"}, 
{"default:copper_ingot", "default:copper_ingot", "default:copper_ingot"}, 
{"toshamod:plastic", "toshamod:plastic", "toshamod:plastic"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "toshamod:oil",
	burntime = 45,
})

minetest.register_craft({
	type = "cooking",
	output = "toshamod:diamond_shard",
	recipe = "technic:graphite",
	cooktime = 20,
})


minetest.register_craftitem("toshamod:diamond_shard", {
	description = "Diamond Shard",
	inventory_image = "diamond_shard.png"
})

minetest.register_craft({
	output = "default:diamond",
	recipe = { 

{"toshamod:diamond_shard", "toshamod:diamond_shard"}, 
{"toshamod:diamond_shard", "toshamod:diamond_shard"},
	}
})

minetest.register_node("toshamod:plastic_block", {
	description = "Plastic Block",
	tiles = {"plastic_block.png"},
	groups = {snappy=1,cracky=3,oddly_breakable_by_hand=3,flamable=0,},

})

minetest.register_node("toshamod:rubium_block", {
	description = "Rubium Block",
	tiles = {"rubium_block.png"},
	groups = {snappy=1,cracky=1,oddly_breakable_by_hand=0,flamable=1,stone=1},

})

minetest.register_craft({
	output = "toshamod:rubium_ingot 2",
	recipe = { 
{"", "default:steel_ingot", ""}, 
{"default:steel_ingot", "dye:red", "default:steel_ingot"}, 
{"", "default:steel_ingot", ""}
	}
})

minetest.register_craft({
	output = "toshamod:rubium_block",
	recipe = { 
{"toshamod:rubium_ingot", "toshamod:rubium_ingot", "toshamod:rubium_ingot"}, 
{"toshamod:rubium_ingot", "toshamod:rubium_ingot", "toshamod:rubium_ingot"}, 
{"toshamod:rubium_ingot", "toshamod:rubium_ingot", "toshamod:rubium_ingot"}
	}
})

minetest.register_craft({
	output = "toshamod:plastic_block",
	recipe = { 
{"toshamod:plastic", "toshamod:plastic", "toshamod:plastic"}, 
{"toshamod:plastic", "toshamod:plastic", "toshamod:plastic"}, 
{"toshamod:plastic", "toshamod:plastic", "toshamod:plastic"}
	}
})

minetest.register_craft({
	output = "toshamod:plastic 9",
	recipe = { 
{"toshamod:plastic_block"}
	}
})

minetest.register_abm({
	nodenames = {"defualt:papyrus"},
	neighbors = {"defualt:water_source"},
	interval = 45.0,
	chance = 3,	
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.set_node({x = pos.x, y = pos.y + 1 , z = pos.z}, {name = "defualt:papyrus"})
    end
})

minetest.register_tool("toshamod:rubium_shovel", {
	description = "Rubium Shovel",
	inventory_image = "rubium_shovel.png",
	wield_image = "rubium_shovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.5, [2]=0.65, [3]=0.35}, uses=12, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("toshamod:rubium_axe", {
	description = "Rubium Axe",
	inventory_image = "rubium_axe.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.80, [2]=1.20, [3]=0.75}, uses=12, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("toshamod:rubium_sword", {
	description = "Rubium Sword",
	inventory_image = "rubium_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.90, [2]=0.90, [3]=0.30}, uses=12, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_tool("toshamod:rubium_pickaxe", {
    description = "Rubium Pickaxe",
    inventory_image = "rubium_pickaxe.png",
    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=1.60, [2]=0.80, [3]=0.35}, uses=12, maxlevel=3}
        }	
    }
})

minetest.register_craft({
	output = "toshamod:rubium_shovel",
	recipe = { 
{'toshamod:rubium_ingot', '', ''}, {'default:stick', '', ''}, {'default:stick', '', ''}
	}
})

minetest.register_craft({
	output = "toshamod:rubium_pickaxe",
	recipe = { 
{'toshamod:rubium_ingot', 'toshamod:rubium_ingot', 'toshamod:rubium_ingot'}, {'', 'default:stick', ''}, {'', 'default:stick', ''}
	}
})

minetest.register_craft({
	output = "toshamod:rubium_axe",
	recipe = { 
{'toshamod:rubium_ingot', 'toshamod:rubium_ingot', ''}, {'toshamod:rubium_ingot', 'default:stick', ''}, {'', 'default:stick', ''}
	}
})

minetest.register_craft({
	output = "toshamod:rubium_sword",
	recipe = { 
{'toshamod:rubium_ingot', '', ''}, {'toshamod:rubium_ingot', '', ''}, {'default:stick', '', ''}
	}
})

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
			
			local S = technic.getter

function technic.register_spinner(data)
	data.typename = "spinning"
	data.machine_name = "spinner"
	data.machine_desc = S("%s Spinner")
	technic.register_base_machine(data)
end
