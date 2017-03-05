obj
	story
		tablet_bottom
			icon = 'story.dmi'
			icon_state = "tablet_bottom"
			density = 1
			Click()
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
					else
						usr << "<b>You're too far to away</b>"
				..()
		tablet_top
			icon = 'story.dmi'
			icon_state = "tablet_top"
			layer = MOB_LAYER+1

