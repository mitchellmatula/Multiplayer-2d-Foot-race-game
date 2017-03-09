obj
	item

		// granite, sandstone, flint

		inorganic
			rock
				layer= OBJ_LAYER
				pixel_x = 0
				pixel_y = 0

				New(_x,_y,_z)
					var randtype = rand(1,1000)
					switch(randtype)
						if(1 to 300) // small brownstone
							weight = rand(1,20)
							src.icon = 'inorganics.dmi'
							src.name = "Brownstone"
							src.hardness = rand(2,3)
							src.strength = rand(3,5)
							src.density = 0
							src.pixel_x = rand(-10,10)
							src.pixel_y = rand(-10,10)

						if(301 to 399) // medium brownstone
							weight = rand(150,749)
							src.icon = 'inorganics.dmi'
							src.icon_state = "medium_brownstone[rand(1,3)]"
							src.name = "Brownstone"
							density = 1
							src.hardness = rand(2,3)
							src.strength = rand(3,5)
							src.pixel_x = rand(-4,4)
							src.pixel_y = rand(-4,4)

						if(400 to 450) // large brownstone
							src.icon = 'inorganics.dmi'
							src.icon_state = "large_brownstone_bottom"
							src.name = "Brownstone"
							density = 1

							src.hardness = rand(2,3)
							src.strength = rand(3,5)
							weight = rand(750,1500)
							overlays += new/obj/item/inorganic/rock/large_brownstone_top

						if(451 to 550) // small greystone
							src.icon_state = "Greystone"
							src.icon = 'inorganics.dmi'
							src.name = "Greystone"
							src.hardness = rand(2,6)
							src.strength = rand(1,7)
							weight = rand(1,20)
						if(451 to 550) // medium greystone
							src.icon_state = "medium_greystone"
							src.icon = 'inorganics.dmi'
							src.name = "Greystone"
							density = 1
							src.hardness = rand(2,6)
							src.strength = rand(1,7)
							weight = rand(150,749)

						if(551 to 600) // large greystone
							src.icon_state = "large_greystone_bottom"
							src.icon = 'inorganics.dmi'
							src.name = "Greystone"
							density = 1

							src.hardness = rand(2,6)
							src.strength = rand(1,7)
							weight = rand(750,1500)
							overlays += new/obj/item/inorganic/rock/large_greystone_top

						if(601 to 700) // small heavystone
							src.icon_state = "Heavystone"
							src.icon = 'inorganics.dmi'
							src.name = "Roughstone"
							weight = rand(5,30)
							src.hardness = rand(3,4)
							src.strength = rand(5,8)
							density = 0
						if(701 to 750)
							src.icon_state = "medium_heavystone[rand(1,2)]"
							src.icon = 'inorganics.dmi'
							src.name = "Medium Roughstone"
							src.hardness = rand(3,4)
							src.strength = rand(5,8)
							density = 1
							weight = rand(350,949)
						if(751 to 800) // large heavystone
							src.icon_state = "large_heavystone_bottom"
							src.icon = 'inorganics.dmi'
							src.name = "Large Roughstone"
							weight = rand(900,1900)

							src.hardness = rand(3,4)
							density = 1
							src.strength = rand(5,8)
							src.overlays += new/obj/item/inorganic/rock/large_heavystone_top

						if(980 to 1000)
							src.icon_state = "Flatstone"
							src.icon = 'inorganics.dmi'
							src.name = "Flatstone"
							src.hardness = rand(5,7)
							src.strength = rand(5,10)
							weight = rand(9,30)
					src.loc = locate(_x,_y,_z)


				large_brownstone_top
					icon = 'inorganics.dmi'
					icon_state = "large_brownstone_top"
					pixel_y = 32
					layer = MOB_LAYER+1
					density = 1

					New()
						src.pixel_y = 32

				large_greystone_top
					icon = 'inorganics.dmi'
					icon_state = "large_greystone_top"

					layer = MOB_LAYER+1
					density = 1
					New()
						src.pixel_y = 32

				large_heavystone_top
					icon = 'inorganics.dmi'
					icon_state = "large_heavystone_top"
					pixel_y = 32
					layer = MOB_LAYER+1
					density = 1

					New()
						src.pixel_y = 32
