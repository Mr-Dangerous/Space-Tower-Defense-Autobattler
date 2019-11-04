//pre state machine changes


switch(state){
	case squad.defend_sector:
	var _nearest_target = instance_nearest(x, y, o_enemy_unit)
	
	if (instance_exists(_nearest_target)){
		var _target_distance = distance_to_object(nearest_target)
	
		if (_target_distance < 500){
			//consider making an array
			with (ship_1){
				//assign the target
			}
			with(ship_2){
				//assign
			}
			with(ship_3){
				//assign
			}
		}
		
	}
	break;

}

//for testing purposes only
if (turncounter = 0){
	turncounter = 1000
	new_direction = irandom(360)
}
if (image_angle != new_direction){
	face_target(new_direction)
	direction = image_angle
}
turncounter --