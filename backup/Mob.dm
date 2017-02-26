mob
	var/list/inventory = new/list()
	var/list/clickobj = new/list()
	var
		lockmovement
		clickx
		clicky

		// skills - 1 untrained 2 novice 3 journeyman 4 master 5 grandmaster
		prospecting

	player
		icon = 'player.dmi'
		prospecting = 1
		New()
			usr.lockmovement = 0
			var hair_random = rand(1,2)
			switch(hair_random)
				if(1)
					usr.overlays += new/obj/custom/hair/male_red_short
				if(2)
					usr.overlays += new/obj/custom/hair/male_black_parted
			usr.overlays += new/obj/custom/torso/male_white_shirt
	Login()
		usr.loc = locate(20,20,1)
		bags(usr)



	verb
		say(t as text)
			world << "[name]: [t]"

		listInv()
			for(var/obj/item/O in usr.inventory)
				usr << "\ref[O] is in slot [O.inv_position]"
			usr << winget(usr,"map","view-size")


		bags(mob/M as mob)
			var/list/items = new
			for(var/obj/item/O in M.inventory)
				items[++items.len] = list(\
					"name" = O.name,
					"icon" = O.icon,
					"inv_position" = O.inv_position,
					"icon_state" = O.icon_state,
					"quality" = O.quality,
					"ref" = "\ref[O]")
			M << output(json_encode(items), "bags")
