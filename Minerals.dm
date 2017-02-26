	mineral

			rock
				layer = OBJ_LAYER


				large_rock
					icon = 'minerals.dmi'
					icon_state = "large_rock"
					//bound_height = 64
					density = 1
					New(_x,_y,_z)
						src.loc = locate(_x,_y,_z)
						weight = rand(750,1500)
						src.overlays += new/obj/item/mineral/rock/large_rock_top

				large_rock_top
					icon = 'minerals.dmi'
					icon_state = "large_rock2"
					pixel_y = 32
					layer = MOB_LAYER+1

				medium_rock
					icon = 'minerals.dmi'
					icon_state = "medium_stone"
					density = 1
					New(_x,_y,_z)
						src.loc = locate(_x,_y,_z)
						weight = rand(150,749)
						src.icon_state = "medium_stone[rand(1,2)]"

				small_rocks
					icon = 'minerals.dmi'
					icon_state = "small_stones"
					density = 0
					New(_x,_y,_z)
						src.loc = locate(_x,_y,_z)
						weight = rand(25,149)
						src.icon_state = "small_stones[rand(1,4)]"

				small_rock
					icon = 'minerals.dmi'
					icon_state = "small_stone"
					density = 0
					New(_x,_y,_z)
						src.loc = locate(_x,_y,_z)
						weight = rand(1,25)


						src.pixel_x = rand(-10,10)
						src.pixel_y = rand(-10,10)