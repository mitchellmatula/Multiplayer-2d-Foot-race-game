/*
	These are simple defaults for your project.
 */

world
	fps = 40		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default
	mob = /mob/player
	// show up to 6 tiles outward from center (13x13 view)
	view = "30x20"
client
	perspective = EDGE_PERSPECTIVE
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




client
	var
		mouse_x
		mouse_y
		mouse_screen_loc

	Click(object,location,control,params)
		params=params2list(params)
		if(istype(object,/obj/mineral))
			if(params["left"])
				var/sloc
				sloc = params["screen-loc"]
				//world<<"Left click [sloc]"
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
				//usr << "mouse x [mouse_x] and mouse y [mouse_y]"

				//usr.client.screen += new /obj/highlight(toplace)
				//ClearButtons()
				//var/dist = "[x],[y],1"
				//var/usrloc = "[usr.loc.x],[usr.loc.y],[usr.loc.z]"
				//var/disttest = get_dist(usrloc, dist)
				//usr << "usrloc: [usrloc] -- target [dist]  -- test [disttest]"


		..()
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