client
	Topic(href, list/href_list)
		..()
		var/action = href_list["action"]
		var/value = href_list["value"]
		switch(action)
			if("look")
				//world << "found say"
				var/obj/target = locate(value)
				if(target)
					world << "The quality of [target] is [target.quality]"