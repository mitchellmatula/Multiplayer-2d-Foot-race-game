mob
	proc
		UpdateInventory()
			var/c = 0
			var/r = 1
			winset(usr,"inventory",{"cells="5x5""})
			for(var/obj/O in src.inventory)
				if(c==5)
					r+=1
					c=0
				src << output(O,"inventory:[++c],[r]")

				//src << output(O.quality,"inventory:2,[i]")
				//src << output(O.suffix, "inventory:2,[items]")