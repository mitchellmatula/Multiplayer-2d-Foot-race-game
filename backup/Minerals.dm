obj
	item
		var
			inv_position

		mineral
			stone
				icon = 'minerals.dmi'
				density = 1
				New()
					src.quality = rand(1,1000)
					switch(src.quality)
						if(1 to 500)
							src.icon_state = "stone"
							src.name = "Stone"
						if(501 to 900)
							src.icon_state = "greenstone"
							src.name = "Greenstone"
						if(901 to 1000)
							src.icon_state = "redstone"
							src.name = "Redstone"
		Click()
			if(src in usr.inventory)
				usr << "[src.name]'s quality is [src.quality]"
				return
			if(usr.lockmovement != 1)
				if(get_dist(usr.loc, src.loc) <= 1)
					usr.lockmovement = 1
					usr.clickobj = new/list()
					usr.clickobj += src

					var/obj/button/H = text2path("/obj/button/highlight")
					new H(usr.client, usr.clickx, usr.clicky)
					var/obj/button/E = text2path("/obj/button/examine")
					new E(usr.client, usr.clickx, usr.clicky)
					var/obj/button/F = text2path("/obj/button/back")
					new F(usr.client, usr.clickx, usr.clicky)
					var/obj/button/G = text2path("/obj/button/get")
					new G(usr.client, usr.clickx, usr.clicky)
				else
					usr << "<b>You're too far to away</b>"
			..()