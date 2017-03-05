turf
	proc
		SpawnInRadius(type in text, radius as num,chance as num,obj_width as num)
			var/list/turfs=new
			for(var/turf/T in range(src,radius))
				if(dist(T)-radius<0.5)//0.5 helps to make edges softer
					turfs+=T

			if(turfs.len)
				for(var/turf/TT in turfs)
					// for each turf in the list of turfs that are the circle

					var/obj/item/I = locate(/obj/item/) in TT
					if(I)
						I.overlays = 0
						del(I)
					if(obj_width == 2)
						var/obj/item/organic/II = locate(/obj/item/organic) in locate(TT.x+1,TT.y,TT.z)
						if(II)
							II.overlays = 0
							del(II)
					if(rand(1,100) <= chance)

						if(TT.name == "Grass")
							var newobj = text2path(type)
							new newobj(TT.x,TT.y,TT.z)
	tileset
		icon = 'tocut.dmi'
	grass
		icon = 'Turfs.dmi'
		icon_state = "grass"
		name = "Grass"
		New(_x,_y,_z)
			src.icon_state = "grass[num2text(rand(1,4))]"
			var occurence = rand(1,1000)
			switch(occurence)
				if(1 to 790)
					return
				if(790 to 800)
					var radius = rand(1,5)
					SpawnInRadius("/obj/item/organic/pinkflower",radius,3,1)
				if(801 to 810)
					var radius = rand(2,4)
					SpawnInRadius("/obj/item/organic/big_tree",radius,50,1)
				if(811 to 817)
					var radius = rand(1,2)
					SpawnInRadius("/obj/item/organic/spruce_tree",radius,70,2)
				if(960 to 969)
					var radius = rand(1,2)
					SpawnInRadius("/obj/item/organic/tallgrass",radius,95,1)

				if(980 to 989)
					var radius = rand(1,3)
					SpawnInRadius("/obj/item/organic/leafygrass",radius,85,1)
				if(990 to 1000)
					var radius = rand(1,2)
					SpawnInRadius("/obj/item/organic/yellowleafyplant",radius,95,1)

	dirt
		icon = 'Turfs.dmi'
		icon_state = "dirt"
		New(_x,_y,_z)
			var occurence = rand(1,1000)
			switch(occurence)
				if(1 to 599)
					// nothing
				if(600 to 1000)
					new/obj/item/inorganic/rock(x,y,z)

	lightDirt
		icon = 'Turfs.dmi'
		icon_state = "lightDirt"
		New(_x,_y,_z)
			var occurence = rand(1,1000)
			switch(occurence)
				if(1 to 899)
					// nothing
				if(900 to 1000)
					new/obj/item/inorganic/rock(x,y,z)

	LightDirtToGrass
		NW
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_NW"
		NN
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_N"
		NE
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_NE"
		W
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_W"
		EE
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_E"
		SW
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_SW"
		SS
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_S"
		SE
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_SE"
		INSIDENW
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_innerNW"
		INSIDENE
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_innerNE"
		INSIDESW
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_innerSW"
		INSIDESE
			icon = 'Turfs.dmi'
			icon_state = "lightDirtToGrass_innerSE"

	PavedStone
		variant1
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner1"
		variant2
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner2"
		variant3
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner3"
		variant4
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner4"
		variant5
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner5"
		variant6
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneInner6"


	PavedStoneToDirt
		NW
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_NW"
		NN
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_N"
		NE
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_NE"
		WW
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_W"
		EE
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_E"
		SW
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_SW"
		SS
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_S"
		SE
			icon = 'Turfs.dmi'
			icon_state = "pavedStoneToDirt_SE"


	grasstodirt
		NW
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtNW"
		NN
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtNN"
		NE
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtNE"
		WW
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtWW"



		EE
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtEE"
		SW
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtSW"
		SS
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtSS"
		SE
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtSE"
		INSIDENW
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtINSIDENW"
		INSIDENE
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtINSIDENE"
		INSIDESW
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtINSIDESW"
		INSIDESE
			icon = 'Turfs.dmi'
			icon_state = "grasstodirtINSIDESE"

	inv
		icon = 'Inv.dmi'