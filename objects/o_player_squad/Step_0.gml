//pre state machine changes


switch(state){
	case squad.defend_sector:
	
	if (enemy_focus_counter = 0){
		nearest_squad = instance_nearest(x,y, o_enemy_squad)
	}
	
	
	
	
	#region unused code
	/*
	i=0
	_enemy_squad_list = ds_list_create()
	while(instance_exists(instance_find(o_enemy_squad, i))){
		var _enemy_squad = instance_find(o_enemy_squad, i)
		//add the units to the list if they are in range
		if (distance_to_object(_enemy_squad < engagement_range)){
			ds_list_add(_enemy_squad_list, _enemy_squad)
		}
		i++
	}
	
	//need to come back to this,
	instance_nth_nearest(x, y, o_enemy_squad, 1)
	*/
	#endregion 
	
	#region some unused code... might reuse it later
	/*
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
	*/
	#endregion

		
	
	if (instance_exists(_nearest_squad)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		var _target_distance = distance_to_object(nearest_squad)
		if (_target_distance < 500){
			//stay focused on one target and retarget once every second if another squad is close
			if (enemy_focus_counter = 0){
				enemy_focus_counter = 60
			}
			
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

//post state machine changes
if (enemy_focus_counter > 0){
	enemy_focus_counter--
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
//