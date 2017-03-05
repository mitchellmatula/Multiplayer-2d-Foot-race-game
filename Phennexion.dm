/*
	These are simple defaults for your project.
 */

world
	fps = 30		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	mob = /mob/player
	// show up to 6 tiles outward from center (13x13 view)
	view = "60x32"
	New()
		for(var/obj/item/organic/big_tree/O in world)
			O.overlays += new/obj/item/organic/big_tree_top(O.loc.x,O.loc.y,O.loc.z)

client
	perspective = MOB_PERSPECTIVE
	// Make objects move 8 pixels per tick when walking
	Move()
		//usr << usr.lockmovement
		if(usr.lockmovement == 1)	return
		return ..()

proc
	ClearButtons()
		for(var/obj/button/S in usr.client.screen)
			if(S==src) continue
			del(S)
	SetScreenLoc(_x,_y,_rowx, _rowy)
		var/screen_loc
		if(usr.loc.x < _x)
			screen_loc = "[_x]+[_rowx],[_y]+[_rowy]"
		if(usr.loc.x > _x)
			screen_loc = "[_x]-[_rowx],[_y]+[_rowy]"
		if(usr.loc.x == _x && usr.loc.y > _y)
			screen_loc = "[_x]+[_rowx],[_y]-[_rowy]"
		if(usr.loc.x == _x && usr.loc.y < _y)
			screen_loc = "[_x]+[_rowx],[_y]+[_rowy]"
		if(usr.loc.x == _x && usr.loc.y == _y)
			screen_loc = "[_x]+[_rowx],[_y]+[_rowy]"
		return screen_loc
obj
	var
		quality
	button
		var
			rowx
			rowy

		examine
			icon = 'options.dmi'
			icon_state = "examine"
			rowx = 2
			rowy = 1

			New(client/C, _x, _y)
				src.screen_loc = SetScreenLoc(_x,_y,rowx, rowy)
				C.screen += src

			Click()
				usr.lockmovement = 0
				usr << "examine: [usr.clickobj[1]]"

				Examine(usr, usr.clickobj[1])

				ClearButtons()
				usr.clickx = 0
				usr.clicky = 0
				usr.clickobj = null
				usr.clickobj = new/list()
				del(src)

		back
			rowx = 1
			rowy = 1
			icon = 'options.dmi'
			icon_state = "back"

			New(client/C, _x, _y)
				src.screen_loc = SetScreenLoc(_x,_y,rowx, rowy)
				C.screen += src

			Click()
				usr.lockmovement = 0
				ClearButtons()
				del(src)
		get
			rowx = 3
			rowy = 1
			icon = 'options.dmi'
			icon_state = "get"

			New(client/C, _x, _y)
				src.screen_loc = SetScreenLoc(_x,_y,rowx, rowy)
				C.screen += src

			Click()
				usr.lockmovement = 0
				Get(usr, usr.clickobj[1])
				ClearButtons()
				del(src)

		highlight
			rowx = 0
			rowy = 0
			icon = 'options.dmi'
			icon_state = "highlight"

			New(client/C, _x, _y)
				src.screen_loc = SetScreenLoc(_x,_y,rowx, rowy)
				C.screen += src





// loam, sand, straw - clay oven
// build fire
// roast rattlestone on fire
// make fire hot
// wait
// finish - break up rattlestones with hammer
// fire clay oven
// make a bellows - hide or cloth + wood = nails or glue
// keep fuel fired - charcoal was best
// fill oven with charcoal then keep pouring ore on top
// at 1350c the molten slag flows out
// what remains is a big piece of bloom, can hammer into ingot from there
// another clay oven needed to heat and hammer out impurities, smaller oven shaped like a clam shell
// from there ingot can be split to mass needed for whatever being made

//silica and calium carbonate in with the iron?