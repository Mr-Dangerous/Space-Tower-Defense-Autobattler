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
	
	if (instance_exists(nearest_squad)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		//might look like if(nearest_squad.sector = sector)
		var _target_distance = distance_to_object(nearest_enemy_ship)
		if (_target_distance < engagement_range){
			//stay focused on one target and retarget once every second if another squad is close
			state = squad.engage_enemy
			assign_ships_squad_target()
		}
		
	}
	if (!instance_exists(nearest_squad) or distance_to_object(nearest_squad)>1000){
		if (!position_meeting(x, y, assigned_grid_space)){
			_direction_to_assigned_space = point_direction(x, y, assigned_grid_space.x, assigned_grid_space.y)
			move_towards_target(_direction_to_assigned_space)
		} else {
			if (speed > 0){
				speed -= acceleration_rate
			}
			if (speed < 0){
				speed = 0
			}
		}
				
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
				move_towards_target(_direction_to_squad)
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
		move_towards_target(_direction_to_target)
		
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
			
				assign_ships_squad_target()
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

//Pilot things
if (instance_exists(pilot)){

}
