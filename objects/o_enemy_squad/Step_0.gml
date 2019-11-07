//pre state machine changes


switch(state){
	case squad.defend_sector:

	i=0
	_enemy_unit_list = ds_list_create()
	while(instance_exists(instance_find(o_enemy_unit, i))){
		var _enemy_unit = instance_find(o_enemy_unit, i)
		//add the units to the list if they are in range
		if (distance_to_object(_enemy_unit < engagement_range)){
			ds_list_add(_enemy_unit_list, _enemy_unit)
		}
		i++
	}
	//Algorithim time!  There's probably a better and faster way to do this.
	_enemy_list_size = ds_list_size(_enemy_unit_list)
	//compare the first distance to the second distance.  If the distance is larger
	//it swaps the smaller value to the first distance slot and the second.
	//when the loop happens, if a swap occurs, it will flip a boolean, sorted.
	//if sorted = false, then the loop happens again with the new list.
	if(!ds_list_empty(_enemy_unit_list))
	{
		swapped = true
		while(swapped = true){
			swapped = false
			for(i=0; i < _enemy_list_size-1; i++){
				var _unit_one = ds_list_find_value(_enemy_unit_list, i)
				var _unit_two = ds_list_find_value(_enemy_unit_list, i+1)
				if (distance_to_object(_unit_one) > distance_to_object(_unit_two)){
					ds_list_set(_enemy_unit_list, i, _unit_two)
					ds_list_set(_enemy_unit_list, i+1, _unit_one)
					swapped = true
				}
			}
		}
	}

		
	
	if (instance_exists(_nearest_target)){
		var _target_distance = distance_to_object(nearest_target)
		
	
		if (_target_distance < 500){
			//consider making an array
		
			with (ship_1){
				
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