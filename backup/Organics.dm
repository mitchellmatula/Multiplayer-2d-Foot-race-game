obj
	item
		organic
			tallgrass
				icon = 'organics.dmi'
				density = 0
				New()
					src.quality = rand(1,1000)
					var randstate = rand(1,3)
					switch(randstate)
						if(1)
							icon_state = "tallgrass"
						if(2)
							icon_state = "tallgrass2"
						if(3)
							icon_state = "tallgrass3"

			moss
				icon = 'organics.dmi'
				density = 0
				New()
					src.quality = rand(1,1000)
					var randstate = rand(1,3)
					switch(randstate)
						if(1)
							icon_state = "moss"
						if(2)
							icon_state = "moss2"
						if(3)
							icon_state = "moss3"

			yellowleafyplant
				icon = 'organics.dmi'
				density = 0
				New()
					src.quality = rand(1,1000)
					var randstate = rand(1,3)
					switch(randstate)
						if(1)
							icon_state = "yellowleafyplant1"
						if(2)
							icon_state = "yellowleafyplant2"
						if(3)
							icon_state = "yellowleafyplant3"
