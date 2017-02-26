proc
	Examine(mob/M, obj/target)
		// determine what the object is


		// minerals
		if(istype(target,/obj/mineral))
			usr << "You examine a stone"
			var/tmp/obj/mineral/O = target
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
		var/tmp/obj/mineral/R = target
		usr.inventory.Add(R)
		R.loc = usr
		M.bags(M)