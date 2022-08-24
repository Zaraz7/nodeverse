minetest.register_node("nv_mineralogy:stone_with_tungsten", {
	description = "Tungsten Ore",
	tiles = {"nv_stone.png^nv_mineral_tungsten.png"},
	groups = {oddly_breakable_by_hand = 3},
	drop = "nv_mineralogy:nv_raw_tungsten",
})

minetest.register_craftitem("nv_mineralogy:nv_raw_tungsten", {
    description = "Raw Tungsten",
    inventory_image = "nv_raw_tungsten.png",
})

minetest.register_node("nv_mineralogy:stone_with_copper", {
	description = "Copper Ore",
	tiles = {"nv_stone.png^nv_mineral_copper.png"},
	groups = {oddly_breakable_by_hand = 3},
	drop = "nv_mineralogy:nv_raw_copper",
})

minetest.register_craftitem("nv_mineralogy:nv_raw_copper", {
	description = "Raw Copper",
	inventory_image = "nv_raw_copper.png",
})

minetest.register_node("nv_mineralogy:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"nv_stone.png^nv_mineral_iron.png"},
	groups = {oddly_breakable_by_hand = 3},
	drop = "nv_mineralogy:nv_raw_iron",
})

minetest.register_craftitem("nv_mineralogy:nv_raw_iron", {
    description = "Raw Iron",
    inventory_image = "nv_raw_iron.png",
})

minetest.register_node("nv_mineralogy:stone_with_silver", {
	description = "Silver Ore",
	tiles = {"nv_stone.png^nv_mineral_silver.png"},
	groups = {oddly_breakable_by_hand = 3},
	drop = "nv_mineralogy:nv_raw_silver",
})

minetest.register_craftitem("nv_mineralogy:nv_raw_silver", {
    description = "Raw Silver",
    inventory_image = "nv_raw_silver.png",
})
