client

	Topic(href, list/href_list, list/href)
		..()
		var/action = href_list["action"]
		var/v1 = href_list["v1"]
		var/v2 = href_list["v2"]

		switch(action)
			if("examine")
				//world << "found say"
				var/obj/item/target = locate(v1)
				if(target)
					Examine(usr, target)
			if("change_inv_slot")  // v1 is ref and v2 is slot
				var/obj/item/target = locate(v1)
				usr << "ref: [v1] and slot : [v2]"
				if(target)

					if(v2=="lefthand")
						target = locate(v1) in usr.inventory
						target.inv_position = "lefthand"
						usr.bags(usr)
						usr << "going to lefthand"
					else
						target.inv_position = text2num(v2)
				else
					usr << "didnt find target"
			if("DropBox")
				var/list/dropinfo = new
				var/obj/item/checkNorth = locate(/obj/item/) in get_step(usr, NORTH)
				var/obj/item/checkWest = locate(/obj/item/) in get_step(usr, WEST)
				var/obj/item/checkEast = locate(/obj/item/) in get_step(usr, EAST)
				var/obj/item/checkSouth = locate(/obj/item/) in get_step(usr, SOUTH)

				var n,w,e,s
				if(checkNorth==null)
					n = 1
				else
					n = 0

				if(checkWest==null)
					w = 1
				else
					w = 0

				if(checkEast==null)
					e = 1
				else
					e = 0

				if(checkSouth==null)
					s = 1
				else
					s = 0


				dropinfo[++dropinfo.len] = list(\
					"ref" = v1,
					"slot" = v2,
					"usrlocx" = usr.loc.x,
					"usrlocy" = usr.loc.y,
					"usrlocz" = usr.loc.z,
					"checkNorth" = n,
					"checkWest" = w,
					"checkEast" = e,
					"checkSouth" = s,
					"usrref" = "\ref[usr]")
				usr << output(json_encode(dropinfo),"dropboxes")
			if("dropitem")
				var/obj/item/target = locate(v1) in usr.inventory
				usr.inventory -= target
				if(v2=="north")
					target.loc = locate(usr.loc.x,usr.loc.y+1,usr.loc.z)
				if(v2=="west")
					target.loc = locate(usr.loc.x-1,usr.loc.y,usr.loc.z)
				if(v2=="east")
					target.loc = locate(usr.loc.x+1,usr.loc.y,usr.loc.z)
				if(v2=="south")
					target.loc = locate(usr.loc.x,usr.loc.y-1,usr.loc.z)
				usr.carry_load -= target.weight
				usr.bags(usr)
			if("lockmovement")
				usr << v1
				if(text2num(v1) == 1)
					usr.lockmovement = 1
				else
					usr.lockmovement = 0
			if("say")

				oview(20) << output(v1,"speechbubble")
client
	var
		mouse_x
		mouse_y
		mouse_screen_loc

	Click(object,location,control,params)
		params=params2list(params)
		if(istype(object,/obj/))
			if(params["left"])
				var/sloc
				sloc = params["screen-loc"]

				var/x = 0
				var/y = 0
				var/s = sloc

				var/xside = copytext(s,1,findtext(s,",",1,0))
				var/yside = copytext(s,length(xside)+2,length(sloc)+1)
				//usr << "--- xside: [xside] and yside: [yside]"
				var/colon1loc = findtext(xside,":",1,0)
				var/colon2loc = findtext(yside,":",1,0)

				x = copytext(xside, 1, colon1loc)
				y = copytext(yside, 1, colon2loc)
				usr.clickx = text2num(x)
				usr.clicky = text2num(y)

		..()