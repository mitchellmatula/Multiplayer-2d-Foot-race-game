obj
	item
		var
			inv_position
			weight
			shock_resistance
			hardness
			strength

		Click()
			if(src in usr.inventory)
				usr << "[src.name]'s weight is [src.weight]"
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
					for(var/obj/item/I in usr.clickobj)
						if(I.weight <= usr.weight_pickup_limit)
							var/obj/button/G = text2path("/obj/button/get")
							new G(usr.client, usr.clickx, usr.clicky)
				else
					usr << "<b>You're too far to away</b>"
			..()

