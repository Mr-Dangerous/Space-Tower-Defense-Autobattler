//pre state machine changes
if (!instance_exists(ship_1) and
!instance_exists(ship_2) and
!instance_exists(ship_3) and
!instance_exists(ship_4) and
!instance_exists(ship_5)){
	instance_destroy()
}

switch(state){
	#region squad.defend_sector
	case enemy_squad.approach_player:
	
	nearest_squad = instance_nearest(x,y, o_player_squad)
		
	if (instance_exists(nearest_squad)){
		//Squad moves towards the target if it's close enough (in the sector later on)
		//might look like if(nearest_squad.sector = sector)
		_travel_direction = point_direction(x, y, nearest_squad.x, nearest_squad.y)
		speed += acceleration_rate
		limit_speed()
		face_target(_travel_direction)
		direction = image_angle
		
		var _target_distance = distance_to_object(nearest_squad)
		if (_target_distance < 500){
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
	if (speed != 0){
		speed =0
	}
	
	if (!instance_exists(targeted_squad)){
		state = enemy_squad.approach_player
	}
	
	
	break;
	#endregion

}

//post state machine changes

//for testing purposes only

//