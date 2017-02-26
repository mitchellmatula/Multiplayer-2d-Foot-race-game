client
	Topic(href, list/href_list, list/href)
		..()
		var/action = href_list["action"]
		var/v1 = href_list["v1"]
		var/v2 = href_list["v2"]

		switch(action)
			if("look")
				//world << "found say"
				var/obj/item/target = locate(v1)
				if(target)
					world << "The quality of [target] is [target.quality], inv_position is [target.inv_position]"
			if("change_inv_slot")  // v1 is ref and v2 is slot
				var/obj/item/target = locate(v1)
				if(target)
					target.inv_position = text2num(v2)
				else
					usr << "didnt find target"
			if("DropBox")
				var/list/dropinfo = new
				var/obj/item/checkNorth = locate(/obj/item/) in get_step(usr, NORTH)
				var/obj/item/checkWest = locate(/obj/item/) in get_step(usr, WEST)
				var/obj/item/checkEast = locate(/obj/item/) in get_step(usr, EAST)
				var/obj/item/checkSouth = locate(/obj/item/) in get_step(usr, SOUTH)
				if(checkNorth.density == 1)
					checkNorth = 0
				else
					checkNorth = 1



				usr << "[checkNorth.density] -- no north!"
				dropinfo[++dropinfo.len] = list(\
					"ref" = v1,
					"slot" = v2,
					"usrlocx" = usr.loc.x,
					"usrlocy" = usr.loc.y,
					"usrlocz" = usr.loc.z,
					"checkNorth" = checkNorth,
					"checkWest" = checkWest.density,
					"checkEast" = checkEast.density,
					"checkSouth" = checkSouth.density,
					"usrref" = "\ref[usr]")
				usr << output(json_encode(dropinfo),"dropboxes")
			if("dropitem")
				var/obj/item/target = locate(v1) in usr.inventory
				usr.inventory -= target
				usr << "[v1] and [v2]"
				if(v2=="north")
					target.loc = locate(usr.loc.x,usr.loc.y+1,usr.loc.z)
				if(v2=="west")
					target.loc = locate(usr.loc.x-1,usr.loc.y,usr.loc.z)
				if(v2=="east")
					target.loc = locate(usr.loc.x+1,usr.loc.y,usr.loc.z)
				if(v2=="south")
					target.loc = locate(usr.loc.x,usr.loc.y-1,usr.loc.z)
				usr.bags(usr)
