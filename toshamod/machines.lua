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
