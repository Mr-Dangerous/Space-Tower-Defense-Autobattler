//Pre state machine checks
/*
if (!instance_exists(ship_target) and target_acquired = false){
	state = alien_interceptor_1.idle
	target_acquired = false
} else {
	state = alien_interceptor_1.approaching
	target_acquired = true
}
*/

#region State Machine
switch (state){
#region alien_interceptor_1.idle
	case alien_interceptor_1.idle:
	//save and set new movement variables.  might want to just make it a new variable.
	turn_speed_previous = turn_speed
	turn_speed = turn_speed/2
	
	
	_formation_direction_offset_calculated = squad_object.direction + formation_direction_offset
	if (_formation_direction_offset_calculated < 0){
		_formation_direction_offset_calculated += 360
	}
	_formation_point_x = (round(lengthdir_x(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.x)
	_formation_point_y = (round(lengthdir_y(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.y)
		
	_distance_to_formation_point = distance_to_point(_formation_point_x, _formation_point_y)
	
	if (_distance_to_formation_point > 0){
		_direction_to_formation_point = point_direction(x, y,  _formation_point_x, _formation_point_y)
		face_target(_direction_to_formation_point)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		if (formation_locked){
			speed = squad_object.speed
			}
			
	}
	if (_distance_to_formation_point = 0){
		
		x = _formation_point_x
		y = _formation_point_y
		speed = 0
		
		if(image_angle != squad_object.direction){
			face_target(squad_object.direction)
		}
		direction = image_angle
	}
	
	//reset movement variables
	turn_speed = turn_speed_previous
			
			
	break;

#endregion
/*General notes before programming this section
approaching state is used when a valid target is acquired in range of the squad.

First, each ship in the squad is assigned a target via a targeting tree.  Interceptors 
focus fighters or interceptors, then focus other types of units, and focus emplacements
after all other ships are destroyed.

When all targers in range of the squad object are destroyed, the ships return to idle state.

*/
	case alien_interceptor_1.approaching:
		
	break;

}
#endregion
