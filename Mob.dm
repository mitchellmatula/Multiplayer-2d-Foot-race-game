mob
	var/list/inventory = new/list()
	var/list/clickobj = new/list()
	var
		lockmovement
		clickx
		clicky
		weight_pickup_limit = 50
		carry_limit
		carry_load
		// skills - 1 untrained 2 novice 3 journeyman 4 master 5 grandmaster
		prospecting

	player
		icon = 'player.dmi'
		prospecting = 1

		New()
			usr.lockmovement = 0
			carry_limit = rand(55,100)
			var hair_random = rand(1,4)
			switch(hair_random)
				if(1)
					usr.overlays += new/obj/custom/hair/male_red_short
				if(2)
					usr.overlays += new/obj/custom/hair/male_black_parted
				if(3)
					usr.overlays += new/obj/custom/hair/male_blue_styled
				if(4)
					usr.overlays += new/obj/custom/hair/male_pink_wavy

			var shirt_random = rand(1,2)
			switch(shirt_random)
				if(1)
					usr.overlays += new/obj/custom/torso/male_white_shirt
				if(2)
					usr.overlays += new/obj/custom/torso/male_grey_shirt

	Login()
		usr.loc = locate(42,36,1)
		spawn(20)
			bags(usr)



	verb
		say(t as text)
			world << "[name]: [t]"
			usr << output(t,"speechbubble");

		listInv()
			usr << output("hihihi","hands");



		bags(mob/M as mob)
			var/list/items = new
			for(var/obj/item/O in M.inventory)
				items[++items.len] = list(
					"name" = O.name,
					"icon" = O.icon,
					"inv_position" = O.inv_position,
					"icon_state" = O.icon_state,
					"weight" = O.weight,
					"ref" = "\ref[O]")

			M << output(json_encode(items), "holding")
			M << output(json_encode(items), "bags")


atom/proc/dist(atom/a)
    if(istype(a,/atom/))
        var/X=a.x-x
        var/Y=a.y-y
        return sqrt((X**2)+(Y**2))