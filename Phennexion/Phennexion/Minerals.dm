obj
	mineral
		stone
			icon = 'minerals.dmi'
			density = 1
			New()
				src.quality = rand(1,1000)
				if(rand(1,2) == 1)
					src.icon_state = "redstone"
				else
					src.icon_state = "stone"
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