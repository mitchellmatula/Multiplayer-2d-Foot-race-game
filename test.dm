turf
	dirt
		icon = 'Turfs.dmi'
		icon_state = "dirt"
		New()
			var occurence = rand(1,1000)
			switch(occurence)
				if(1 to 550)
					// nothing
				if(551 to 770)
					new/obj/item/mineral/rock/small_rocks(x,y,z)
				if(771 to 870)
					new/obj/item/mineral/rock/medium_rock(x,y,z)
				if(871 to 1000)
					new/obj/item/inorganic/rock(x,y,z)