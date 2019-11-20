//scan the hangar array to see if there have been any changes

for (i=0; i<10; i++){
	if (hangar_slots[i, 0] = "filled"){
		if (object_get_name(hangar_slots[i, 1]) != object_get_name(hangar_slots[i, 2])){
			hangar_slots[i, 1] = hangar_slots[i, 2]
			if (i <= 4){
				var _hangar_ship = instance_create_layer(100, 800 + (i*120), "Hangar", hangar_slots[i, 1]) 
			}
			if (i > 4){
				var _hangar_ship = instance_create_layer(300, 800 + ((i-5)*120), "Hangar", hangar_slots[i, 1])
			}
			with (_hangar_ship){
				hangar_slot = other.i
			}
		}
	}
}



