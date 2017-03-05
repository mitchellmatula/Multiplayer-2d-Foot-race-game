proc
	Examine(mob/M, obj/target)
		// determine what the object is
		// minerals
		if(istype(target,/obj/story/tablet_bottom))
			usr.lockmovement = 1
			usr << output("This <font color=#3d0099> stone tablet</font> says..", "thoughtbubble")
			sleep(10)
			usr << output("Welcome to Phennexion", "thoughtbubble")
			sleep(10)
			usr << output("Learn to survive...", "thoughtbubble")
			sleep(10)
			usr << output("Survive then thrive...", "thoughtbubble")
			sleep(10)
			usr << output("Thrive and conquor!", "thoughtbubble")
			usr.lockmovement = 0

		if(istype(target,/obj/item))
			usr << "You examine [target.name]"
			var/tmp/obj/item/O = target
			if(O.weight >= usr.weight_pickup_limit)
				usr << output("This <font color=#3d0099>[target.name]</font> is too heavy to pick up.", "thoughtbubble")
			if(O.weight < usr.weight_pickup_limit)
				var WeightText = WeightToText(O.weight)
				usr << output("This <font color=#3d0099>[target.name]</font> feels [WeightText].", "thoughtbubble")
			// luster - the way a mineral reflects
			//        - metallic,(adamantine), glassy, (waxy), dull
			// hardness - fingernail -2, coin hardness 3, knife - 5.5\
			//          - check moh's scale
			// color - translucent minerals hard to tell
			// streak - color of finely crushed mineral
			//        - need a streak plate
			// habit - 20 different terms
			// cleavage - the way the mineral breaks
			//          - perfect, good, poor
			//          -
			// fracture - breakage that is not flat
			//          - conchioidal (shell shaped like quartz and uneven
			//          - metallic minerals may have a jagged fracture
			//          -
			// magnetism

	Get(mob/M, obj/item/target)
		var/tmp/obj/item/R = target
		var/tmp/found = 0
		if(R.weight+M.carry_load>=M.carry_limit)
			usr << output("I'm carrying too much weight to pick this up as well.", "thoughtbubble")
			return
		else
			if(length(M.inventory) < 16)
				M.inventory.Add(R)

			else
				M << "Your inventory is full!"
				return
			// Loop through each slot, and check if each slot has a corresponding object inv_position, if not, increment further
			for(var/i=1;i<17)
				for(var/obj/item/O in M.inventory)
					if(O.inv_position == i)  // if any of the objs are in position[i] then tell it found
						found = 1
				if(found==0)
					R.inv_position = i
					break
				if(found==1)
					i++
					found = 0

			usr.carry_load += R.weight
			R.loc = usr
			M.bags(M)

	WeightToText(weight as num)
		var amount = usr.carry_limit/weight
		var text
		switch(amount)
			if(25 to 1000)
				text = "extremely light"
			if(10 to 25.99)
				text = "very light"
			if(5 to 9.99)
				text = "slightly heavy"
			if(3 to 4.99)
				text = "heavy"
			if(2 to 2.99)
				text = "very heavy"
			if(0 to 1.99)
				text = "almost too heavy to lift"
		return text