proc
	Examine(mob/M, obj/target)
		// determine what the object is


		// minerals
		if(istype(target,/obj/item))
			usr << "You examine a stone"
			var/tmp/obj/item/O = target
			usr << "[O.name]'s quality:[O.quality]"

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
	Get(mob/M, obj/target)
		var/tmp/obj/item/R = target
		var/tmp/found = 0
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


		R.loc = usr
		M.bags(M)