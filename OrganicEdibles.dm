obj
	item
		organic
			edibles
				redshroom
					icon = 'organics.dmi'
					density = 0
					name = "Redshrooms"
					layer = OBJ_LAYER
					New(_x,_y,_z)
						src.quality = rand(1,1000)
						weight = rand(5,15)/10
						src.icon_state = "redshrooms[rand(1,3)]"
						src.loc = locate(_x,_y,_z)
						src.pixel_x = rand(-2,2)
						src.pixel_y = rand(-2.2)

				brownshroom
					icon = 'organics.dmi'
					density = 0
					name = "Brownshrooms"
					layer = OBJ_LAYER
					New(_x,_y,_z)
						src.quality = rand(1,1000)
						weight = rand(5,15)/10
						src.icon_state = "brownshrooms[rand(1,3)]"
						src.loc = locate(_x,_y,_z)
						src.pixel_x = rand(-2,2)
						src.pixel_y = rand(-2.2)

				assortedgrubs
					icon = 'organics.dmi'
					density = 0
					name = "Assorted Grubs"
					layer = OBJ_LAYER
					New(_x,_y,_z)
						src.quality = rand(1,1000)
						weight = rand(5,15)/10
						src.icon_state = "assortedgrubs[rand(1,2)]"
						src.loc = locate(_x,_y,_z)
						src.pixel_x = rand(-2,2)
						src.pixel_y = rand(-2.2)