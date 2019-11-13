//pre state machine changes
if (ship_1 = 0 and
ship_2 = 0 and
ship_3 = 0 and
ship_4 = 0 and
ship_5 = 0){
	instance_destroy()
}
	
	
switch(state){
	#region 
	case enemy_squad.approach_player:
	nearest_player_ship = instance_nearest(x, y, o_player_ship)
	if (instance_exists(nearest_player_ship)) nearest_squad = nearest_player_ship.squad_object
	_distance_to_squad = distance_to_object(nearest_squad)
	if (!instance_exists(nearest_squad) or _distance_to_squad > 500){
		nearest_squad = player_base
	}

		
	if (instance_exists(player_base)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		//might look like if(nearest_squad.sector = sector)
		_travel_direction = point_direction(x, y, player_base.x, player_base.y)
		speed += acceleration_rate
		limit_speed()
		face_target(_travel_direction)
		direction = image_angle
		
		//interrupt to engage a nearby squad
		var _target_distance = distance_to_object(nearest_player_ship)
		if (_target_distance < engagement_range){
			//stay focused on one target and retarget once every second if another squad is close
			state = enemy_squad.engage_player
			targeted_squad = nearest_squad
			
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
	
	break;
	#endregion
	
	
	#region engage_player
	case enemy_squad.engage_player:
	if (speed != 0){
		speed =0
	}
	
	if (!instance_exists(targeted_squad)){
		state = enemy_squad.approach_player
		targeted_squad = noone
	}
	
	
	break;
	
	#endregion

}

//post state machine changes

//for testing purposes only

//