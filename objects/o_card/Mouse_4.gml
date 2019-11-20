var _mouse_on_card = position_meeting(mouse_x, mouse_y, self)

if (_mouse_on_card){
	
	for (i=0; i < 10; i++){
		if (hangar_object.hangar_slots[i, 0] = "empty"){
			with(hangar_object){
				hangar_slots[other.i, 0] = "filled"
				hangar_slots[other.i, 2] = other.hangar_resource
				var message = object_get_name(hangar_slots[other.i,2])
				show_debug_message(message)
			
			}
			instance_destroy()
			break;	
		}
	}
}