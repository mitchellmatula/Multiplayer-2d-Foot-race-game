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
	Login()
		usr.loc = locate(3,3,1)



	verb
		say(t as text)
			world << "[name]: [t]"

		showsubprompt()
			winset(src, "firstclass", "is-visible=true")
			src << output("I'm a prompt!", "firstclass")


		bags(mob/M as mob)
			var/list/items = new
			for(var/obj/O in M.inventory)
				items[++items.len] = list(\
					"name" = O.name,
					"icon" = O.icon,
					"icon_state" = O.icon_state,
					"quality" = O.quality,
					"ref" = "\ref[O]")
			M << output(json_encode(items), "bags")