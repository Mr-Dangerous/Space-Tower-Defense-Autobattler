mouse_left_pressed = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_released = mouse_check_button_released(mb_left)

switch(state){
	case hangar_object.in_hangar:
	image_angle += .5
	if (mouse_left_pressed){
		if (instance_position(mouse_x, mouse_y, self)){
			state = hangar_object.moving
		}
	}
	x = original_x
	y = original_y
	break;
	
	case hangar_object.moving:
		image_angle = 0
		x = mouse_x
		y = mouse_y
		var _distance_to_origin = distance_to_point(original_x, original_y)
		//moving_graphic_scale = graphic_scale - (_distance_to_origin / 10)
		//clamp(moving_graphic_scale, 1, graphic_scale)
		image_xscale = moving_graphic_scale
		image_yscale = moving_graphic_scale
		if (mouse_left_released){
			var _nearest_grid_box = instance_nearest(mouse_x, mouse_y, o_grid_box)
			if (distance_to_object(_nearest_grid_box) < 25 and _nearest_grid_box.player_unit_stored = noone){
				//create the ship
				var _ship = instance_create_layer(_nearest_grid_box.x, _nearest_grid_box.y, "Ships", final_ship_resource)
				with (_ship){
					assigned_grid_space = _nearest_grid_box
				}
				with (_nearest_grid_box){
					player_unit_stored = _ship
				}
				
				//empty the hangar
				hangar.hangar_slots[hangar_slot, 0] = "empty"
				hangar.hangar_slots[hangar_slot, 2] = 0
				instance_destroy()
			} else {
				x = original_x
				y = original_y
				state = hangar_object.in_hangar
			}
		}
	break;

}