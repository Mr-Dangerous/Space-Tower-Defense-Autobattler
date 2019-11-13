//o_player_squad step event

//pre state machine changes
if (ship_1 = 0 and
ship_2 = 0 and
ship_3 = 0 and
ship_4 = 0 and
ship_5 = 0){
	instance_destroy()
}

if (engaging_enemy = false and assist_requested = true){
	
	state = squad.assist_ally
}
	

switch(state){
	#region squad.defend_sector
	case squad.defend_sector:
	engaging_enemy = false
	//detect the nearest squad
	nearest_enemy_ship = instance_nearest(x, y, o_enemy_ship)
	if (distance_to_object(nearest_enemy_ship) < engagement_range){
		//here's teh code where the ships will return to their home grid box	
	}
	if (instance_exists(nearest_enemy_ship)) nearest_squad = nearest_enemy_ship.squad_object
	
	
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

		
	
	if (instance_exists(nearest_squad)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		//might look like if(nearest_squad.sector = sector)
		var _target_distance = distance_to_object(nearest_enemy_ship)
		if (_target_distance < engagement_range){
			//stay focused on one target and retarget once every second if another squad is close
			state = squad.engage_enemy
			
			if (instance_exists(ship_1)){
				with (ship_1){
					target_acquired = true
					targeted_squad = other.nearest_squad
				}
			}
			if (instance_exists(ship_2)){
				with (ship_2){
					target_acquired = true
					targeted_squad = other.nearest_squad
				}
			}
			if (instance_exists(ship_3)){
				with (ship_3){
					target_acquired = true
					targeted_squad = other.nearest_squad
				}
			}
			if (instance_exists(ship_4)){
				with (ship_4){
					target_acquired = true
					targeted_squad = other.nearest_squad
				}
			}
			if (instance_exists(ship_5)){
				with (ship_5){
					target_acquired = true
					targeted_squad = other.nearest_squad
				}
			}
		}
		
	}
	if (!instance_exists(nearest_squad)){
		//testing purposes only
		if (turncounter = 0){
		turncounter = 1000
		new_direction = irandom(360)
		}
		if (image_angle != new_direction){
			face_target(new_direction)
			direction = image_angle
		}
		turncounter --
	}
	break;
	#endregion
	
	
	#region engage_enemy
	case squad.engage_enemy:
		engaging_enemy = true
		if (instance_exists(nearest_squad)){
			_distance_to_squad = distance_to_object(nearest_squad)
			if (_distance_to_squad > 150){
				_direction_to_squad = point_direction(x, y, nearest_squad.x, nearest_squad.y)
				face_target(_direction_to_squad)
				direction = image_angle
				speed += acceleration_rate
				limit_speed()
			} else {
				speed = 0
				direction = 0
				image_angle = 0
			}
		}
		if (assist_call_range_counter = 0){
		assist_call_range_counter ++
		}
		if (assist_call_range_counter > 0){
			assist_call_range_counter++
			if (assist_call_range_counter > 10000){
				assist_call_range_counter = 1000
			}
			
			nearest_allied_squad = instance_nth_nearest(x, y, o_player_squad, 2)
			_distance_to_allied_squad = distance_to_object(nearest_allied_squad)
			if (_distance_to_allied_squad < assist_call_range_counter){
				with(nearest_allied_squad){
					assist_requested = true
					assist_target = nearest_squad
				}
			}
				
		}
		show_debug_message(assist_call_range_counter)
		
		if (!instance_exists(nearest_squad)){
			state = squad.defend_sector
			assist_call_range_counter = 0
		}
	
	break;
	#endregion
	
	#region assist ally
	case squad.assist_ally:
	if (instance_exists(assist_target)){
		_direction_to_target = point_direction(x, y, assist_target.x, assist_target.y)
		face_target(_direction_to_target)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		
		nearest_enemy_ship = instance_nearest(x, y, o_enemy_ship)
		if (instance_exists(nearest_enemy_ship)) nearest_squad = nearest_enemy_ship.squad_object
		
		if (instance_exists(nearest_squad)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		//might look like if(nearest_squad.sector = sector)
			var _target_distance = distance_to_object(nearest_enemy_ship)
			
			if (_target_distance < engagement_range){
				//stay focused on one target and retarget once every second if another squad is close
				state = squad.engage_enemy
				assist_requested = false
				engaging_enemy = true
			
				if (instance_exists(ship_1)){
					with (ship_1){
						target_acquired = true
						targeted_squad = other.nearest_squad
					}
				}
				if (instance_exists(ship_2)){
					with (ship_2){
						target_acquired = true
						targeted_squad = other.nearest_squad
					}
				}
				if (instance_exists(ship_3)){
					with (ship_3){
						target_acquired = true
						targeted_squad = other.nearest_squad
					}
				}
				if (instance_exists(ship_4)){
					with (ship_4){
						target_acquired = true
						targeted_squad = other.nearest_squad
					}
				}
				if (instance_exists(ship_5)){
					with (ship_5){
						target_acquired = true
						targeted_squad = other.nearest_squad
					}
				}
			}
		
		}
	}
	
	if (!instance_exists(assist_target)){
		engaging_enemy = false
		assist_requested = false
		assist_target = noone
		state = squad.defend_sector
			
	}
	
	
		
		
	break;
	#endregion
	

}

//post state machine changes
if (enemy_focus_counter > 0){
	enemy_focus_counter--
}

//for testing purposes only

//