obj
	item
		organic
			tallgrass
				icon = 'organics.dmi'
				density = 0
				layer = OBJ_LAYER
				name = "Tallgrass"
				New(_x,_y,_z)
					src.icon_state = "tallgrass[rand(1,3)]"
					src.loc = locate(_x,_y,_z)
					src.weight = rand(10,25)/10
					src.pixel_x = rand(-4,4)
					src.pixel_y = rand(-4.4)
			bushygrass
				icon = 'organics.dmi'
				density = 0
				layer = OBJ_LAYER
				name = "Bushygrass"
				New(_x,_y,_z)
					src.icon_state = "bushygrass[rand(1,3)]"
					src.loc = locate(_x,_y,_z)
					src.weight = rand(15,30)/10
			leafygrass
				icon = 'organics.dmi'
				density = 0
				layer = OBJ_LAYER
				name = "Leafygrass"
				New(_x,_y,_z)
					src.icon_state = "leafygrass[rand(1,6)]"
					src.loc = locate(_x,_y,_z)
					src.weight = rand(15,30)/10
					src.pixel_x = rand(-4,4)
					src.pixel_y = rand(-4.4)
			moss
				icon = 'organics.dmi'
				density = 0
				name = "Moss"
				New(_x,_y,_z)
					src.quality = rand(1,1000)
					src.icon_state = "moss[rand(1,3)]"
					src.loc = locate(_x,_y,_z)
					weight = rand(10,35)/10

			yellowleafyplant
				icon = 'organics.dmi'
				density = 0
				layer = OBJ_LAYER
				name = "Yellow Leafyplant"
				New(_x,_y,_z)
					src.quality = rand(1,1000)
					weight = rand(5,15)/10
					src.icon_state = "yellowleafyplant[rand(1,3)]"
					src.loc = locate(_x,_y,_z)
					src.pixel_x = rand(-4,4)
					src.pixel_y = rand(-4.4)
			pinkflower
				icon = 'organics.dmi'
				density = 0
				name = "Pinkflower"
				layer = OBJ_LAYER
				New(_x,_y,_z)
					src.quality = rand(1,1000)
					weight = rand(5,15)/10
					src.icon_state = "pinkflower[rand(1,3)]"
					src.loc = locate(_x,_y,_z)
					src.pixel_x = rand(-2,2)
					src.pixel_y = rand(-2.2)



			deadlog
				icon = 'organics.dmi'
				density = 0
				name = "Deadlog"
				layer = OBJ_LAYER
				New(_x,_y,_z)
					src.quality = rand(1,100)
					weight = rand(5,15)/10
					src.icon_state = "deadlog[rand(1,2)]"
					src.loc = locate(_x,_y,_z)
					src.pixel_x = rand(-2,2)
					src.pixel_y = rand(-2.2)





			big_tree //http://www.woodweb.com/cgi-bin/calculators/calc.pl
				icon = 'Tree.dmi'
				icon_state = "base"
				density = 1
				layer = OBJ_LAYER
				name = "Big Leafytree"
				New(_x,_y,_z)
					weight = rand(500,1200)
					src.loc = locate(_x,_y,_z)
			big_tree_top
				icon = 'tree_top.dmi'
				icon_state = "base_right"
				density = 0
				New(_x,_y,_z)
					src.pixel_y = 32
					src.pixel_x = -64
					layer = OBJ_LAYER+(1000-_y)+(_x*0.2013)

			spruce_tree
				icon = 'spruce_bottom.dmi'
				icon_state = "spruce_bottom"
				density = 1
				layer = OBJ_LAYER
				bound_width = 64
				name = "Big Needletree"
				New(_x,_y,_z)
					weight = rand(500,1200)
					src.overlays += new/obj/item/organic/spruce_tree_top(_x,_y,_z)

					src.loc = locate(_x,_y,_z)

			spruce_tree_top
				icon = 'spruce_top.dmi'
				density = 0
				layer = MOB_LAYER+1

				New(_x,_y,_z)
					src.pixel_y = 32
					src.layer = MOB_LAYER+(700-_y)+(_x*0.042345)
